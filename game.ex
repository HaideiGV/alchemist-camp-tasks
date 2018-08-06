defmodule Game do
    # Guessing game module

    def guess(high, low) do
        IO.puts low
        IO.puts high
    end

    def mid(high, low) do
        div high + low, 2
    end

    def bigger(high, low) do
        new_low = min(high, mid(high, low) + 1)
        guess(new_low, high)
    end

    def smaller(high, low) do
        new_high = max(low, mid(high, low) - 1)
        guess(low, new_high)
    end
end