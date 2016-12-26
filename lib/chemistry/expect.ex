defmodule Chemistry.Expect do

  defmacro __using__(_options) do
    quote do
      import unquote(__MODULE__)
      Module.register_attribute __MODULE__, :labs, accumulate: true
      @before_compile unquote(__MODULE__)
    end
  end

  defmacro __before_compile__(_env) do
    quote do
      def run, do: Chemistry.Lab.run(@labs, __MODULE__)
    end
  end

  defmacro it(description, do: it_block) do
    it_func = String.to_atom(description)
    quote do
      @labs {unquote(it_func), unquote(description)}
      def unquote(it_func)(), do: unquote(it_block)
    end
  end

  defmacro expect({operator, _, [lhs, rhs]}) do
    quote bind_quoted: [operator: operator, lhs: lhs, rhs: rhs] do
      Chemistry.Lab.expect(operator, lhs, rhs)
    end
  end

end

defmodule Chemistry.Lab do
  def run(labs, module) do
    Enum.each labs, fn {it_func, description} ->
      case apply(module, it_func, []) do
        :ok             -> IO.write "."
        {:fail, reason} -> IO.puts """
          ===========================================
          FAILURE: #{description}
          ===========================================
          #{reason}
          """
      end
    end
  end

  def expect(:==, lhs, rhs) when lhs == rhs do
    :ok
  end

  def expect(:==, lhs, rhs) do
    {
      :fail, 
      """
      FAILURE:
        Expected: #{lhs} to be equal to #{rhs}
      """
    }
  end

  def expect(:>, lhs, rhs) when lhs > rhs do
    :ok
  end

  def expect(:>, lhs, rhs) do
    {
      :fail,
      """
      FAILURE:
        Expected: #{lhs} to be greater than #{rhs}
      """
    }
  end

end
