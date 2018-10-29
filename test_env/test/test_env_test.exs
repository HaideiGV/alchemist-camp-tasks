defmodule TestEnvTest do
  use ExUnit.Case
  doctest TestEnv

  test "greets the world" do
    assert TestEnv.hello() == :world
  end
end
