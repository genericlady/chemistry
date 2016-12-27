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
