use Mix.Config

# In this file, we keep production configuration that
# you likely want to automate and keep it away from
# your version control system.
config :rumble, Rumble.Endpoint,
  secret_key_base: "9GrSZHVOSPVPBEhGIHz3ZA9kVEF7RORZV1vV7/KlDQdVTL5R7UZ4lDJtOdCNrfFv"

# Configure your database
config :rumble, Rumble.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "rumble_prod",
  pool_size: 20
