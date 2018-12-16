defmodule Day3 do
  def part1(input) do
    input
    |> String.splitter("\n", trim: true)
    |> Stream.map(&String.trim/1)
    |> Enum.to_list()
    |> counted_coordinates_from_list()
    |> Enum.filter( fn {_, value} -> value > 1  end)
    |> Enum.count()
  end

  def part2(input) do
    area_strings = input
    |> String.splitter("\n", trim: true)
    |> Stream.map(&String.trim/1)
    |> Enum.to_list()

    invalid_coords_mapset = area_strings
    |> counted_coordinates_from_list()
    |> Enum.filter( fn {_, value} -> value > 1  end)
    |> Enum.reduce(MapSet.new(), fn {coord, _}, acc ->
      MapSet.put(acc, coord)
    end)

    valid_coordinates_from_list(area_strings, invalid_coords_mapset)
  end

  defp valid_coordinates_from_list(areas_list, invalid_coords_mapset) do
    Enum.reduce_while(areas_list, nil, fn position, _ ->
      {id_value, coords} = id_and_all_coords_from_string(position)
      coords_map = MapSet.new(coords)
      intersection = MapSet.intersection(coords_map, invalid_coords_mapset)
      if MapSet.size(intersection) == 0, do: {:halt, id_value}, else: {:cont, 0}
    end)
  end

  defp counted_coordinates_from_list(areas_list) do
    areas_list
    |> Enum.reduce(%{}, fn position, areas ->
      {_, coords} = id_and_all_coords_from_string(position)
      new_map = Enum.reduce(coords, %{}, fn coord, acc ->
        Map.update(acc, coord, 1, &(&1 + 1))
      end)

      Map.merge(areas, new_map, fn _k, v1, v2 ->
        v1 + v2
      end)
    end)
    |> Map.to_list
  end

  defp id_and_all_coords_from_string(coords_string) do
    area = Regex.named_captures(~r/^#(?<id>\d+) @ (?<x>\d+),(?<y>\d+): (?<w>\d+)x(?<h>\d+)$/, coords_string)
    x_value = String.to_integer(area["x"])
    y_value = String.to_integer(area["y"])
    w_value = String.to_integer(area["w"])
    h_value = String.to_integer(area["h"])
    id_value = String.to_integer(area["id"])

    coords = for x_position <- x_value..(x_value + w_value - 1), y_position <- y_value..(y_value + h_value - 1), do: {x_position, y_position}
    {id_value, coords}
  end
end