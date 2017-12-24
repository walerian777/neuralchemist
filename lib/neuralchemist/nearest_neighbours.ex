defmodule Neuralchemist.NearestNeighbours do
  @default_params %{
    k_neighbours: 5,
    weights: :uniform,
    distance: :euclidean
  }

  def predict(training_data, test_data, params \\ %{}) do
    params = Map.merge(@default_params, params)
    training_data
    |> sort_by_distance(test_data, params)
    |> Enum.take(Map.get(params, :k_neighbours))
    |> elem(0)
  end

  defp sort_by_distance(training_data, test_data, %{ distance: distance }) do
    Enum.map(training_data, fn(label, values) ->
      {label, distance(values, elem(test_data, 1), distance)}
    end)
  end

  defp distance(p, q, metric) do
    apply(Distancia, metric, [p, q])
  end
end
