defmodule Neuralchemist.NearestNeighbours do
  @moduledoc """
  A module which provides `predict` function based on k-nearest neighbours algorithm.
  """

  @default_params %{
    k_neighbours: 5,
    weights: :uniform,
    distance: :euclidean
  }

  def predict(training_data, test_data, params \\ %{}) do
    params = Map.merge(@default_params, params)
    k_neighbours = Map.get(params, :k_neighbours)
    training_data
    |> map_to_distance(test_data, params)
    |> Enum.sort_by(&elem(&1, 1))
    |> Enum.take(k_neighbours)
    |> take_mode()
    |> elem(0)
  end

  defp map_to_distance(training_data, test_data, %{distance: distance}) do
    Enum.map(training_data, fn(data) ->
      label = elem(data, 0)
      sample = elem(data, 1)
      {label, distance(sample, test_data, distance)}
    end)
  end

  defp distance(p, q, metric) do
    apply(Distancia, metric, [p, q])
  end

  defp take_mode(list) do
    list
    |> Enum.reduce(%{}, &heatmap/2)
    |> Enum.max_by(&elem(&1, 1))
  end

  defp heatmap({label, _}, acc) do
    Map.update(acc, label, 1, &(&1 + 1))
  end
end
