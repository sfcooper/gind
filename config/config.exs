# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :gind,
  ecto_repos: [Gind.Repo]

# Configures the endpoint
config :gind, GindWeb.Endpoint,
  url: [host: "localhost", port: 80],
  http: [port: 8080],
  cache_static_manifest: "priv/static/manifest.json",
  secret_key_base: "3Vo48pk1ouiXfRTEo3u4kovBcShcsSN5hHTIlYaGxsVxi74tnXOomnTizq4DM5zD",
  render_errors: [view: GindWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Gind.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
