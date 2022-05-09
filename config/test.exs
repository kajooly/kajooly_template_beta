import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :kajooly_template_beta, KajoolyTemplateBetaWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "XxRltbZmDuMu+qhYb2oPnkm+Cl0g3W/SiZTK7EhyBMEa00OjVbsKLLfoz2SdPN55",
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
