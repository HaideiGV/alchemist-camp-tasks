filename = IO.gets("Source file for count words:") |> String.trim

words =
  File.read!(filename)
  |> String.split(~r{(\\n|[^\w'])+})
  |> Enum.filter(fn x -> x != "" end)

IO.puts("File contains #{Enum.count(words)} words.")

lines =
  File.read!(filename)
  |> String.split("\n")

IO.puts("File contains #{Enum.count(lines)} lines.")


chars =
  File.read!(filename)
  |> String.split("")

IO.puts("File contains #{Enum.count(chars)} chars.")