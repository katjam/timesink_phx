# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :timesink_phx,
  ecto_repos: [TimesinkPhx.Repo]

# Configures the endpoint
config :timesink_phx, TimesinkPhxWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "sgDzibsd5d31I1CnO8dRjSKToh76Fpeuo2B05Sym5uFFYonxkL8iAMV1A93iccwz",
  render_errors: [view: TimesinkPhxWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: TimesinkPhx.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
