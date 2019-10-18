defmodule LivePhoenixExample.Repo do
  use Ecto.Repo,
    otp_app: :live_phoenix_example,
    adapter: Ecto.Adapters.Postgres
end
