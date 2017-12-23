defmodule Neuralchemist.NearestNeighbours do
  @default_params %{
    k_neighbours: 5,
    weights: :uniform,
    distance: :euclidean
  }

  def predict(training_data, test_data, params \\ %{}) do
    params = Map.merge(@default_params, params)
    Enum.map(training_data, fn(label, values) ->
      {label, distance(values, elem(test_data, 1), Map.get(params, :distance))}
    end)
  end

  defp distance(p, q, metric) do
    apply(Distancia, metric, [p, q])
  end
end
