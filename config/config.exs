use Mix.Config

config :opengraph, :http_client, OpenGraph.HTTPClient

import_config "#{Mix.env}.exs"
