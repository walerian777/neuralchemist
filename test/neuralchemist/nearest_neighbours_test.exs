defmodule Neuralchemist.NearestNeighboursTest do
  use ExUnit.Case

  alias Neuralchemist.NearestNeighbours

  @doc """
  Features are weight (in grams) and color (represented by an integer):
  red    1
  orange 2
  yellow 3
  green  4
  blue   5
  purple 6
  """
  @training_data [
    {"banana", {303, 3}},
    {"apple",  {370, 1}},
    {"banana", {298, 3}},
    {"banana", {277, 3}},
    {"apple",  {377, 4}},
    {"banana", {299, 3}},
    {"apple",  {382, 1}},
    {"apple",  {374, 4}},
    {"banana", {303, 4}},
    {"banana", {309, 3}},
    {"apple",  {359, 1}},
    {"apple",  {366, 1}},
    {"banana", {311, 3}},
    {"banana", {302, 3}},
    {"apple",  {373, 4}},
    {"banana", {305, 3}},
    {"apple",  {371, 3}}
  ]

  test "predict returns a proper label" do
    {label, test_data} = List.last(@training_data)
    assert NearestNeighbours.predict(@training_data, test_data) == label
  end

  test "predict returns a banana" do
    banana_features = {300, 4}
    assert NearestNeighbours.predict(@training_data, banana_features) == "banana"
  end

  test "predict returns an apple" do
    banana_features = {360, 1}
    assert NearestNeighbours.predict(@training_data, banana_features) == "apple"
  end
end
