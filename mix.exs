defmodule Opengraph.Mixfile do
  use Mix.Project

  def project do
    [
      app: :opengraph,
      version: "0.1.0",
      elixir: "~> 1.3",
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      deps: deps(),
      description: "A module for parsing OpenGraph data.",
      package: package(),
   ]
  end

  def package do
    [
      maintainers: ["Alexander Akhmetov"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/alexander-akhmetov/opengraph"}
    ]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger]]
  end

  defp deps do
    [
      {:httpoison, "~> 0.10.0"},
      {:floki, "~> 0.11.0"},
      {:mock, "~> 0.2.0", only: :test},
      {:ex_doc, ">= 0.0.0", only: :dev},
    ]
  end
end
