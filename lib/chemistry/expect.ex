defmodule Chemistry.Expect do
  defmacro expect({operator, _, [lhs, rhs]}) do
    quote bind_quoted: [operator: operator, lhs: lhs, rhs: rhs] do
      Chemistry.Test.expect(operator, lhs, rhs)
    end
  end
end

defmodule Chemistry.Test do
  def expect(:==, lhs, rhs) when lhs == rhs do
    IO.write "."
  end

  def expect(:==, lhs, rhs) do
    IO.puts """
    FAILURE:
      Expected: #{lhs} to be equal to #{rhs}
    """
  end

  def expect(:>, lhs, rhs) when lhs > rhs do
    IO.write "."
  end

  def expect(:>, lhs, rhs) do
    IO.puts """
    FAILURE:
      Expected: #{lhs} to be greater than #{rhs}
    """
  end

end
