defmodule Exlibfunc.Repo.Migrations.CreateGames do
  use Ecto.Migration

  def change do
    create table(:games) do
      add :appid, :integer
      add :name, :string
      add :status, :boolean, default: true, null: false

      timestamps(type: :utc_datetime)
    end
  end
end
