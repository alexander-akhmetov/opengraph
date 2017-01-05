# OpenGraph  [ WIP! ] [![Build Status](https://travis-ci.org/alexander-akhmetov/opengraph.svg?branch=master)](https://travis-ci.org/alexander-akhmetov/opengraph) [![Hex pm](https://img.shields.io/hexpm/v/opengraph.svg)](https://hex.pm/packages/opengraph)

OpenGraph is an Elixir package to parse [OpenGraph data](http://ogp.me) from webpages. ([Docs](https://hexdocs.pm/opengraph/))

## Usage

```elixir
iex(1)> OpenGraph.parse("https://yandex.ru")

{:ok,
 %OpenGraphData{description: "Найдётся всё",
  image: "https://yastatic.net/morda-logo/i/share-logo-ru.png",
  title: "Яндекс", url: "https://yandex.ru"}}

iex(2)>
```

## Installation

1. Add `opengraph` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [{:opengraph, "~> 0.1.0"}]
end
```

2. Ensure `opengraph` is started before your application:

```elixir
def application do
  [applications: [:opengraph]]
end
```
