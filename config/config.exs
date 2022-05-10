# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

# Configures the endpoint
config :kajooly_template_beta, KajoolyTemplateBetaWeb.Endpoint,
  url: [host: "localhost"],
  render_errors: [view: KajoolyTemplateBetaWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: KajoolyTemplateBeta.PubSub,
  live_view: [signing_salt: "JeTjAFZC"]

# Configure esbuild (the version is required)
config :esbuild,
  version: "0.14.0",
  default: [
    args:
      ~w(js/app.js --bundle --target=es2017 --outdir=../priv/static/assets --external:/fonts/* --external:/images/*),
    cd: Path.expand("../assets", __DIR__),
    env: %{"NODE_PATH" => Path.expand("../deps", __DIR__)}
  ]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config(:kajooly_template_alfa,
    page_suffix: " - Software & Startup Premium Landing Page Template",
    page_lang: :en,
    mode: "light",
    width: "fluid",
    menuPosition: "fixed",
    sidebar: %{
      color:  "light",
      size: "default",
    showuser: false},
    topbar: %{color: "light"},
    showRightSidebarOnPageLoad: false,
    layoutsFrom: KajoolyAuthNWeb.LayoutView,
    sidebar_html_path: nil,
    navbar_html_path: nil,
    favicon_path: nil,
    logo_dark_path: nil,
    logo_light_path: nil)

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
