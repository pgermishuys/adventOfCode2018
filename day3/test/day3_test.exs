defmodule Day3Test do
  use ExUnit.Case

  test "part 1 example" do
    input = """
    #1 @ 1,3: 4x4
    #2 @ 3,1: 4x4
    #3 @ 5,5: 2x2
    """
    assert Day3.part1(input) == 4
  end
  test "part 1 input" do
    {:ok, contents} = File.read("input.txt")
    assert Day3.part1(contents) == 4
  end
  test "part 2 input" do
    {:ok, contents} = File.read("input.txt")
    assert Day3.part2(contents) == 4
  end
end
