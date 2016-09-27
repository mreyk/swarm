defmodule Swarm.Mixfile do
  use Mix.Project

  def project do
    [app: :swarm,
     version: "1.0.2",
     elixir: "~> 1.3",
     elixirc_paths: elixirc_paths(Mix.env),
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     description: "Easy clustering, with registration and distribution of worker processes.",
     package: package,
     docs: docs(),
     deps: deps()]
  end

  def application do
    [applications: [:logger, :crypto, :inets, :poison],
     mod: {Swarm, []}]
  end

  defp deps do
    [{:ex_doc, "~> 0.13", only: :dev},
     {:benchee, "~> 0.4", only: :dev},
     {:porcelain, "~> 2.0", only: [:dev, :test]},
     {:poison, "~> 2.2"}]
  end

  defp package do
    [files: ["lib", "src", "mix.exs", "README.md", "LICENSE.md"],
     maintainers: ["Paul Schoenfelder"],
     licenses: ["MIT"],
     links: %{ "Github": "https://github.com/bitwalker/swarm" }]
  end

  defp docs do
    [main: "readme",
     formatter_opts: [gfm: true],
     extras: [
       "README.md"
     ]]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]
end
