# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

# Configures the endpoint
config :webchika_api, WebchikaApiWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "NS/HC+In4XzAt/W6A05Xml4OQSUFgMBbwzOL2coBeodRa6GShiW+lxIAjwc+Ckd9",
  render_errors: [view: WebchikaApiWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: WebchikaApi.PubSub,
  live_view: [signing_salt: "8HAfMDEN"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
