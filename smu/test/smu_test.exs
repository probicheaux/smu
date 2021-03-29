defmodule SmuTest do
  use ExUnit.Case
  doctest Smu

  test "greets the world" do
    assert Smu.hello() == :world
  end
end
