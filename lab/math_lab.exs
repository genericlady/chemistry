defmodule MathLab do
  use Chemistry.Lab

  it "Can use integers for addition and subtraction." do
    expect 2 + 3 == 5
    expect 5 - 5 == 10
  end

  it "Can use integers for multiplication and division" do
    expect 5 * 5 == 25
    expect 10 / 2 == 5
  end
end
