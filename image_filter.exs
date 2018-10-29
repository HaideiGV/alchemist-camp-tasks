# dir_path = IO.gets("Write dir path (Default is current dir): ") |> String.strip

file_extensions = ["jpg", "gif", "bmp", "png"]
new_dir_name = "filtered_images"
File.mkdir(new_dir_name)

{:ok, files} = File.ls(".")

images = 
    files 
    |> Enum.filter(fn(x) -> Enum.member?(file_extensions, x |> String.split(".") |> Enum.at(-1)) end)

IO.puts(images)

Enum.map(
    images, 
    fn(image) -> 
        File.rename(Path.absname(image), Path.absname(new_dir_name) <> "/" <> image)
    end
)


