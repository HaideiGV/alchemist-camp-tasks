defmodule TestTask do
    def run(x) do
        :timer.sleep(20000)
        x * 12
    end
end