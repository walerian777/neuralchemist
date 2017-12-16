defmodule Neuralchemist.NearestNeighbors do
  @default_params %{
    k_neighbors: 5,
    weights: :uniform,
    distance: :euclidean
  }

  def predict(training_data, test_samples, params \\ %{}) do
    params = Map.merge(@default_params, params)
  end

  defp distance(p, q, metric) do
    apply(Distancia, metric, [p, q])
  end
end
