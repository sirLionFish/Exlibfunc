defmodule Exlibfunc.Repo do
  use Ecto.Repo,
    otp_app: :exlibfunc,
    adapter: Ecto.Adapters.Postgres
end
