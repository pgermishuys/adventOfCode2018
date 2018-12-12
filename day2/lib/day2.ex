defmodule Day2 do
  def compute_checksum(items) do
    items
    |> String.splitter("\n", trim: true)
    |> Enum.map(fn x -> 
        boxId = String.trim x
        map = count_characters boxId
        Enum.uniq_by(map, fn {_k, v} -> v end)
      end)
    |> checksum
  end
  def checksum(items) do
    count_twos(items) * count_threes(items)
  end
  def count_characters(string) do
    string
    |> String.to_charlist()
    |> Enum.reduce(%{}, fn codepoint, acc ->
        Map.update(acc, codepoint, 1, fn x -> x + 1 end)
      end)
  end
  def count_twos(items) do
    items
    |> Enum.filter(&has_twos?/1)
    |> Enum.count()
  end
  def count_threes(items) do
    items
    |> Enum.filter(&has_threes?/1)
    |> Enum.count()
  end
  defp has_twos?(items) do
    Enum.any?(items, fn {_, count} -> count == 2 end)
  end
  defp has_threes?(items) do
    Enum.any?(items, fn {_, count} -> count == 3 end)
  end

  def compute_difference(items) do
    words = items
    |> String.splitter("\n", trim: true)
    |> Enum.map(fn x -> 
        String.trim x
      end)

    words
    |> Enum.map(fn x ->
      for item <- words do
        result = String.graphemes(x) -- String.graphemes(item)
        if Enum.count(result) == 1 do 
          x = String.replace(x, Enum.at(result, 0), "")
          IO.inspect x
          x
        end
      end
    end)
    |> List.flatten
    |> Enum.filter(fn x -> !is_nil(x) end)
    |> Enum.at(0)
  end
end
