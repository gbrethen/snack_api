defmodule SnacksApi.Repo do
  use Ecto.Repo,
    otp_app: :snacks_api,
    adapter: Ecto.Adapters.Postgres
end
