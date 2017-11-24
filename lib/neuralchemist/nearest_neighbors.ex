defmodule Neuralchemist.NearestNeighbors do
  @default_params %{
    k_neighbors: 5,
    weights: :uniform, # :distance
    distance: :euclidean # :mahalanobis
  }

  def predict(training_data, test_samples, params \\ %{}) do
    params = Map.merge(@default_params, params)
  end

  defp distance(p, q, :euclidean), do: Neuralchemist.Utils.EuclideanDistance
  defp distance(p, q, :mahalanobis), do: Neuralchemist.Utils.MahalanobisDistance
end
