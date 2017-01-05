defmodule OpenGraphData do
  defstruct title: "",
            description: "",
            image: "",
            url: ""
  @type t :: %OpenGraphData{title: string, description: string, image: string, url: string}
end

defmodule OpenGraph.Parser do
  @http_client Application.get_env(:opengraph, :http_client, OpenGraph.HTTPClient)

  def parse(url) do
    case @http_client.get(url) do
      {:ok, html_body} -> {:ok, _parse_opengraph_data(html_body)}
      {:error, reason} -> {:error, reason}
    end
  end

  defp _parse_opengraph_data(html_body) do
    meta_tags = [
      "title",
      "description",
      "image",
      "url",
    ]

    # We have to extract content for every tag in 'meta_tags' list
    extract_tag_and_save_to_acc_map = fn (tag_name, acc) ->
      with {:ok, tag_content} <- _get_content_from_opengraph_tag(html_body, tag_name),
        do: Map.put(acc, String.to_atom(tag_name), tag_content)
    end

    Enum.reduce(meta_tags, %OpenGraphData{}, extract_tag_and_save_to_acc_map)
  end

  @doc """
   Extracts opengraph tag's with specified name content from HTML body.

   ## Parameters

     - html_body: HTML body of the page
     - tag: OpenGraph tag's name
   """
  defp _get_content_from_opengraph_tag(html_body, tag) do
    meta_info = Floki.find(html_body, "meta[property='og:#{tag}']")
                  |> Floki.attribute("content")

    case meta_info do
      [content| _] -> {:ok, content}
      _ -> {:ok, ""}
    end
  end

end
