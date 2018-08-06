defmodule Greet do

    @author "Slava"

    def start do
        name = IO.gets("Put your name: ") |> String.trim |> String.downcase |> String.capitalize
        case name do
            @author ->
              IO.puts "Wow! I made by #{@author} too. Nice to meet you."

            name ->
              IO.puts "Hi, #{name}"
        end
    end
end