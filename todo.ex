defmodule Todo do

  def start do
    filename = IO.gets("Name of CSV file to load: ") |> String.trim
    read(filename)
  end

  def read(filename) do
    case File.read(filename) do
      {:ok, body} -> body
      {:error, reason} -> IO.puts ~s(Could not open the file "#{filename}"\n)
                          IO.puts ~s("#{:file.format_error reason}"\n)
                          start()
    end
  end

  def parse(body) do
    lines = String.split(body, ~r{(\r\n|\r|\n)})
  end
end