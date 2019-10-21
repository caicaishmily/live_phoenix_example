# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :live_phoenix_example,
  ecto_repos: [LivePhoenixExample.Repo]

# Configures the endpoint
config :live_phoenix_example, LivePhoenixExampleWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "rY+I9TSK5a7dbnnVFlBitIep1ryxrVaWJkuumN5KZtxIZXG/8D1D/g4UYs+1zQ4Z",
  render_errors: [view: LivePhoenixExampleWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: LivePhoenixExample.PubSub, adapter: Phoenix.PubSub.PG2],
  live_view: [signing_salt: "8Y/M50wMhcSze2UfP9T5WjA7Z2Mf4d+7NsFbbqGvIzwQ02HElePbl8SjXjx1zuF4"]

config :phoenix,
  template_engines: [leex: Phoenix.LiveView.Engine]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
