defmodule DiffCheck.MixProject do
  use Mix.Project

  def project do
    [
      app: :diff_check,
      version: "0.0.0",
      elixir: "1.15.7",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      aliases: aliases(),
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: [
        coveralls: :test,
        "coveralls.detail": :test,
        "coveralls.post": :test,
        "coveralls.html": :test,
        "coveralls.cobertura": :test
      ]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:credo, "1.7.0", only: [:dev, :test], runtime: false},
      {:excoveralls, "0.18.0", only: :test}
    ]
  end

  defp aliases do
    [
      lint: ["format", "credo"],
      "lint.ci": ["format --check-formatted", "credo"]
    ]
  end
end
