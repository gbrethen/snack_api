import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :snacks_api, SnacksApi.Repo,
  username: "postgres",
  password: "BrAnDoN9991!",
  database: "snacks_api_test#{System.get_env("MIX_TEST_PARTITION")}",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :snacks_api, SnacksApiWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "Ig3xBMDwkWEguo2KLjPtiZcXymSOCa0zDtbjM+L9i7/Rbw8RB3DHMqckN1Ztv4wx",
  server: false

# In test we don't send emails.
config :snacks_api, SnacksApi.Mailer, adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
