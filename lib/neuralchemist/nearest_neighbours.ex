defmodule Neuralchemist.NearestNeighbours do
  @default_params %{
    k_neighbours: 5,
    weights: :uniform,
    distance: :euclidean
  }

  def predict(training_data, test_data, params \\ %{}) do
    params = Map.merge(@default_params, params)
    training_data
    |> map_to_distance(test_data, params)
    |> Enum.take(Map.get(params, :k_neighbours))
    |> IO.inspect
    |> elem(0)
  end

  defp map_to_distance(training_data, test_data, %{ distance: distance }) do
    Enum.map(training_data, fn(data) ->
      label = elem(data, 0)
      sample = elem(data, 1)
      {label, distance(sample, test_data, distance)}
    end)
  end

  defp distance(p, q, metric) do
    apply(Distancia, metric, [p, q])
  end
end
