defmodule Neuralchemist.Mixfile do
  use Mix.Project

  def project do
    [
      app: :neuralchemist,
      version: "0.1.0",
      elixir: "~> 1.5",
      start_permanent: Mix.env == :prod,
      deps: deps()
    ]
  end

  def application do
    []
  end

  defp deps do
    [
      {:credo, "~> 0.8", only: [:dev, :test], runtime: false},
      {:distancia, "~> 0.1.2"}
    ]
  end
end
