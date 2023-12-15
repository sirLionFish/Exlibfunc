defmodule Exlibfunc.Servers.Manager do
  import Ecto.Query, warn: false

  alias Exlibfunc.Repo
  alias Exlibfunc.Servers.Server

  def list_servers,
    do: Repo.all(from s in Server, order_by: [asc: s.id])

  def get_server!(id),
    do: Repo.get!(Server, id)

  def create_server(attrs \\ %{}) do
    %Server{}
    |> Server.changeset(attrs)
    |> Repo.insert()
  end

  def update_server(%Server{} = server, attrs) do
    server
    |> Server.changeset(attrs)
    |> Repo.update()
  end

  def delete_server(%Server{} = server) do
    Repo.delete(server)
  end

  def change_server(%Server{} = server, attrs \\ %{}) do
    Server.changeset(server, attrs)
  end
end
