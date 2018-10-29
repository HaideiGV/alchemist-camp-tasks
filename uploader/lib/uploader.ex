defmodule Uploader do

  import HTTPoison

  def start do
    IO.gets("Paste file URI here: ") 
    |> String.strip
    |> retrive_file_data
    |> save_file
  end

  def retrive_file_data(file_url) do
    {:ok, %HTTPoison.Response{body: body}} = HTTPoison.get(file_url)
    body
  end

  def save_file(file_data) do
    Path.relative_to_cwd("filename.jpeg")
    |> Path.absname
    |> File.write!(file_data)
  end

  def validator(file_data) do
  
  end
end
