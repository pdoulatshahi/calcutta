# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :calcutta,
  ecto_repos: [Calcutta.Repo]

# Configures the endpoint
config :calcutta, Calcutta.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "YIZDDfO+dS9pUL3YUKwh9+oBBUhW3mWqPUj6XUYEUzY71iP2r0wKI16o6ruwHp5w",
  render_errors: [view: Calcutta.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Calcutta.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
