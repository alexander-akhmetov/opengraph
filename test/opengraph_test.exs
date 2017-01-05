defmodule TestOpenGraphParse do
  use ExUnit.Case

  test "test_parsed_opengraph_response_data" do
    # we use test config with OpenGraph.HTTPClient.Fake
    # which should return fake data
    {:ok, parsed_data} = OpenGraph.parse("http://elixir-lang")

    expected_data = %OpenGraphData{
      title: "Elixir",
      url: "http://elixir-lang.org/elixir",
      image: "http://elixir-lang.org/images/logo/logo.png",
      description: "Elixir lang. Main page."
    }

    # should parse opengraph data
    assert parsed_data == expected_data
  end

  test "test_parse_opengraph_data_with_title_only" do
    # we use test config with OpenGraph.HTTPClient.Fake
    # which should return fake data
    {:ok, parsed_data} = OpenGraph.parse("http://github")

    expected_data = %OpenGraphData{
      title: "Github",
      url: "",
      image: "",
      description: ""
    }

    # should parse opengraph data
    assert parsed_data == expected_data
  end
end
