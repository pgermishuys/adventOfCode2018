# Problem 1 Example
input = """
+1
-2
+3
+1
"""
String.split(input, "\n", trim: true)
|> Enum.map(fn x -> String.to_integer(x) end)
|> Enum.sum
|> IO.inspect

# Problem 1 with file
{:ok, contents} = File.read("../input.txt")
contents
|> String.split("\n", trim: true)
|> Enum.map(fn x -> String.to_integer(x) end)
|> Enum.sum
|> IO.inspect

# Problem 1 with file (more efficient alternative by providing "recipies")
{:ok, contents} = File.read("../input.txt")
contents
|> String.splitter("\n", trim: true)
|> Stream.map(fn x -> String.to_integer(x) end)
|> Enum.sum
|> IO.inspect

# Problem 2 with file
{:ok, contents} = File.read("../input.txt")
contents
|> String.splitter("\n", trim: true)
|> Stream.map(fn x -> 
    {number, _dontcare} = Integer.parse(x)
    number
   end)
|> Stream.cycle()
|> Enum.reduce_while({0, [0]}, fn x, {current_frequency, frequencies} ->
    new_frequency = current_frequency + x
    if new_frequency in frequencies do
        {:halt, new_frequency}
    else
        {:cont, {new_frequency, [new_frequency | frequencies]}}
    end
   end)
|> IO.puts 