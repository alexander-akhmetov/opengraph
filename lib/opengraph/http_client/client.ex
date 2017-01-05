defmodule OpenGraph.HTTPClient do
  @moduledoc """
  The HTTPClient is internal module that module provides get/1 function to fetch given URL's HTML content.
  """
  def get(url) do
    HTTPoison.start()

    options = [hackney: [{:follow_redirect, true}]]
    case HTTPoison.get(url, [], options) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} -> {:ok, body}
      {:ok, %HTTPoison.Response{status_code: 404}} -> {:error, "Page not found"}
      {:error, %HTTPoison.Error{reason: reason}} -> {:error, reason}
    end
  end
end
