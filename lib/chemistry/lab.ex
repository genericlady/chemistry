defmodule Chemistry.Lab do

  defmacro __using__(_options) do
    quote do
      import unquote(__MODULE__)
      Module.register_attribute __MODULE__, :labs, accumulate: true
      @before_compile unquote(__MODULE__)
    end
  end

  defmacro __before_compile__(_env) do
    quote do
      def run, do: Chemistry.Expect.run(@labs, __MODULE__)
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
      Chemistry.Expect.expect(operator, lhs, rhs)
    end
  end

end


