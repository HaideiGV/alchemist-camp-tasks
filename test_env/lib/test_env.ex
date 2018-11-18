defmodule TestEnv do
  
  def listen do
    receive do
      {:ok, value} -> IO.puts(">>>>>:You wrote: #{value}.")
      {:notok, value} -> IO.puts("<<<<<<< #{value}\n.")
    end
    listen
  end
end
