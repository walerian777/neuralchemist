defmodule NeuralchemistTest do
  use ExUnit.Case
  doctest Neuralchemist

  test "greets the world" do
    assert Neuralchemist.hello() == :world
  end
end
