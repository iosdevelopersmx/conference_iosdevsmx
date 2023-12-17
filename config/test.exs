import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :conference_iosdevsmx, ConferenceIosdevsmx.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "conference_iosdevsmx_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :conference_iosdevsmx, ConferenceIosdevsmxWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "t5xLMZ5Cq0k503GhAa2mk4k14vULnwkcSxeDh5Hi4dRrrfE3Zguc9OqxPj766WMV",
  server: false

# In test we don't send emails.
config :conference_iosdevsmx, ConferenceIosdevsmx.Mailer, adapter: Swoosh.Adapters.Test

# Disable swoosh api client as it is only required for production adapters.
config :swoosh, :api_client, false

# Print only warnings and errors during test
config :logger, level: :warning

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
