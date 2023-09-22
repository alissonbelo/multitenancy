defmodule Multitenancy.Repo do
  use Ecto.Repo,
    otp_app: :multitenancy,
    adapter: Ecto.Adapters.Postgres
end
