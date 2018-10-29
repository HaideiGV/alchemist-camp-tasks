defmodule Timer do
    def profile(fun, opts) do
        {time, result} = :timer.tc(fun, opts)
        IO.puts("Time: #{time}.")
        IO.puts("Result: #{result}.")
    end
end