defmodule Day2Test do
  use ExUnit.Case

  test "counts characters" do
    assert Day2.count_characters("aabbcc") == %{
      ?a => 2,
      ?b => 2,
      ?c => 2
    }
  end
  test "computes checksum" do
    items = "
      abcdef
      bababc
      abbcde
      abcccd
      aabcdd
      abcdee
      ababab
    "
    assert Day2.compute_checksum(items) == 12
  end

  test "computes checksum with input" do
    {:ok, contents} = File.read("input.txt")
    assert Day2.compute_checksum(contents) == 7533
  end

  test "computes changes in boxids" do
    input = "
      abcde
      fghij
      klmno
      pqrst
      fguij
      axcye
      wvxyz
    "
    assert Day2.compute_difference(input) == "fgij"
  end

  test "computes changes in boxids with input" do
    {:ok, contents} = File.read("input.txt")
    assert Day2.compute_difference(contents) == "fgij"
  end
end
