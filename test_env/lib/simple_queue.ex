defmodule SimpleQueue do
    use GenServer

    def start_link(state \\ []), do: GenServer.start_link(__MODULE__, state, name: __MODULE__)
    def init(state), do: {:ok, state}

    def handle_call(:dequeue, _from, []), do: {:reply, nil, []}
    def handle_call(:dequeue, _from, [value | state]), do: {:reply, value, state}
    def handle_call(:queue, _from, state), do: {:reply, state, state}

    def handle_cast({:push, value}, state), do: {:noreply, state ++ [value]}

    def queue, do: GenServer.call(__MODULE__, :queue)
    def dequeue, do: GenServer.call(__MODULE__, :dequeue)
    def push(value), do: GenServer.cast(__MODULE__, {:push, value})
    
end