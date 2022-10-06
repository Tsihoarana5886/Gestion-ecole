defmodule Ecoles.Repo do
  use Ecto.Repo,
    otp_app: :ecoles,
    adapter: Ecto.Adapters.Postgres
end
