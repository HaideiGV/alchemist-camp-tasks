defmodule Greet do
    def start do
        name = IO.gets "Put your name: "
        name = name |> String.trim |> String.downcase
        case name == "slava" do
            true -> IO.puts "Wow! I made by #{String.capitalize(name)} too. Nice to meet you."
            false -> IO.puts "Hi, #{String.capitalize(name)}"
        end
    end
end