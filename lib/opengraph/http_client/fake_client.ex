defmodule OpenGraph.HTTPClient.Fake do
  @moduledoc """
  The HTTPClient.Fake is internal HTTPClient implementation for tests only.
  """

  @fake_elixir_html_body """
  <html prefix='og: http://elixir-lang.org'>
  <head>
  <title>Elixir Lang</title>
  <meta property='og:title' content='Elixir' />
  <meta property='og:type' content='text/html' />
  <meta property='og:description' content='Elixir lang. Main page.' />
  <meta property='og:url' content='http://elixir-lang.org/elixir' />
  <meta property='og:image' content='http://elixir-lang.org/images/logo/logo.png' />
  </head>
    <body>
      test page
    </body>
  </html>
  """

  @fake_html_body_with_title_only """
  <html prefix='og: https://github.com'>
  <head>
  <meta property='og:title' content='Github' />
  </head>
    <body>
      test page
    </body>
  </html>
  """

  @doc """
    Returns @fake_html_body_with_title_only if URL's host is "github".
    Otherwise returns @fake_elixir_html_body.
   """
  def get(url) do
    case URI.parse(url).host do
      "github" -> {:ok, @fake_html_body_with_title_only}
      _ -> {:ok, @fake_elixir_html_body}
    end
  end
end
