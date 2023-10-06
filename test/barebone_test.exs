defmodule BareboneTest do
  use ExUnit.Case
  doctest Barebone

  test "greets the world" do
    assert Barebone.hello() == :world
  end
end
