defmodule Neuralchemist.Utils.ManhattanDistance do
  alias Neuralchemist.Utils.Parser

  def calculate(p, q) do
    parse_arguments(p, q)
    |> Enum.zip()
    |> Enum.reduce(0, fn({a, b}, acc) -> abs(a - b) + acc end)
  end

  defp parse_arguments(p, q) do
    [Parser.to_list(p), Parser.to_list(q)]
  end
end
