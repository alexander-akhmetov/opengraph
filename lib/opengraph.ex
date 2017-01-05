defmodule OpenGraph do
  @moduledoc """
  Provides a function `parse/1` to parse opengraph data from given URL.
  """

  alias OpenGraph.Parser

  @doc """
   Parses opengraph data from given URL.

   ## Parameters

     - url: URL for page to parse

   ## Examples

   iex(1)> OpenGraph.parse("https://yandex.ru")

   {:ok,
    %OpenGraphData{description: "Найдётся всё",
     image: "https://yastatic.net/morda-logo/i/share-logo-ru.png",
     title: "Яндекс", url: "https://yandex.ru"}}

   ## Returns

      {:ok, %OpenGraphData{}} or {:error, reason}
   """
  def parse(url) do
    Parser.parse(url)
  end
end
