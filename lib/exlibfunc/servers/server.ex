defmodule Exlibfunc.Servers.Server do
  use Ecto.Schema
  import Ecto.Changeset

  schema "servers" do
    field :size, :float
    field :name, :string
    field :git_repo, :string
    field :framework, :string
    field :last_commit_id, :string
    field :last_commit_message, :string
    field :status, :string, default: "down"
    field :deploy_count, :integer, default: 0

    timestamps(type: :utc_datetime)
  end

  def changeset(server, attrs) do
    server
    |> cast(attrs, [
        :name,
        :size,
        :status,
        :git_repo,
        :framework,
        :deploy_count,
        :last_commit_id,
        :last_commit_message
      ])
    |> validate_required([
        :name,
        :size,
        :status,
        :git_repo,
        :framework,
        :deploy_count,
        :last_commit_id,
        :last_commit_message
      ])
  end
end
