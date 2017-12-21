defmodule Neuralchemist.Mixfile do
  use Mix.Project

  def project do
    [
      app: :neuralchemist,
      version: "0.1.0",
      elixir: "~> 1.4",
      start_permanent: Mix.env == :prod,
      description: description(),
      package: package(),
      deps: deps(),
      name: "Neuralchemist",
      source_url: "https://github.com/walerian777/neuralchemist"
    ]
  end

  def application do
    []
  end

  defp deps do
    [
      {:credo, "~> 0.8", only: [:dev, :test], runtime: false},
      {:distancia, "~> 0.1.2"},
      {:ex_doc, "~> 0.18", only: :dev, runtime: false}
    ]
  end

  defp description do
    """
    Neuralchemist is a library for machine learning stuff.
    """
  end

  defp package do
    [
      files: ["lib", "mix.exs", "README*", "LICENSE*"],
      maintainers: ["Walerian Sobczak"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/walerian777/neuralchemist"}
    ]
  end
end
