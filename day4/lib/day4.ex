defmodule Day4 do
  def parse(input) do
    input
    |> String.splitter("\n", trim: true)
    |> Stream.map(&String.trim/1)
    |> Enum.to_list()
    |> Enum.map(&get_shifts/1)
    |> IO.inspect
  end

  def get_shifts(input) do
    guard_duties = Regex.named_captures(~r/\[(?<date>(.*))\] (?<action>(Guard #(?<id>(\d+))|falls|wakes))/, input)
    IO.inspect guard_duties
    {:ok, date, _} = DateTime.from_iso8601(guard_duties["date"] <> ":00+0000")
    action = guard_duties["action"]
    id = guard_duties["id"]
    {date, action, id}
  end
end
