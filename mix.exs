defmodule Chemistry.Mixfile do
  use Mix.Project

  @version "0.1.0"

  def project do
    [
      app: :chemistry,
      version: @version,
      elixir: "~> 1.3",
      deps: deps(),
      name: "Chemistry",
      source_url: "https://github.com/genericlady/chemistry",
      docs: [source_ref: "v#{@version}", main: "readme", extras: ["README.md"]],
      description: description(),
      package: package()
    ]
  end

  def application do
    [applications: [:logger]]
  end

  defp deps do
    [
      {:ex_doc, "~> 0.12", only: :dev} 
    ]
  end

  defp description do
    """
    Chemistry is a Testing Framework for your Elixir projects.
    """
  end

  defp package do
    [
      maintainers: ["Yianna Kokalas"],
      licenses: ["Apache 2.0"],
      links: %{"Github" => "https://github.com/genericlady/chemistry"}
    ]
  end
end
