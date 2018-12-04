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