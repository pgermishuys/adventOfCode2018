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
String.split(contents, "\n", trim: true)
|> Enum.map(fn x -> String.to_integer(x) end)
|> Enum.sum
|> IO.inspect