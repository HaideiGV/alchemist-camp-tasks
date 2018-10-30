defmodule CustomJobsTest do
  use ExUnit.Case
  doctest CustomJobs

  test "greets the world" do
    assert CustomJobs.hello() == :world
  end
end
