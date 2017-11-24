defmodule Neuralchemist.Utils.EuclideanDistance do
  def calculate(p, q) do
    parse_arguments(p, q)
    |> Enum.zip()
    |> Enum.reduce(0, fn({a, b}, acc) -> :math.pow(a - b, 2) + acc end)
    |> :math.sqrt()
  end

  defp parse_arguments(p, q) do
    [parse(p), parse(q)]
  end

  defp parse(list) when is_list(list), do: list
  defp parse(tuple) when is_tuple(tuple), do: Tuple.to_list(tuple)
  defp parse(number) when is_number(number), do: [number]
end
