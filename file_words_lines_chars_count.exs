filename = IO.gets("Source file for count words:") |> String.trim

text = File.read!(filename)

words =
  text
  |> String.split(~r{(\\n|[^\w'])+})
  |> Enum.filter(fn x -> x != "" end)

IO.puts("File contains #{Enum.count(words)} words.")

lines =
  text
  |> String.split("\n")

IO.puts("File contains #{Enum.count(lines)} lines.")


chars =
  text
  |> String.split("")

IO.puts("File contains #{Enum.count(chars)} chars.")