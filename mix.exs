defmodule Elavon.Mixfile do
  use Mix.Project

  @version "0.0.1-dev"

  def project do
    [
      app: :elavon,
      version: @version,
      elixir: "~> 1.5",
      elixirc_paths: elixirc_paths(Mix.env),
      start_permanent: Mix.env == :prod,
      deps: deps()
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_),     do: ["lib"]

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger, :httpoison]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:commerce_cure, git: "https://github.com/auroche/commerce_cure.git", tag: "0.0.2"},
      {:ecto, "~> 2.2"},
      {:httpoison, "~> 0.13"},
      {:poison, "~> 3.1"},
      {:credo, "~> 0.8", only: [:dev, :test], runtime: false},
      {:faker, "~> 0.9", only: :test},
    ]
  end
end
