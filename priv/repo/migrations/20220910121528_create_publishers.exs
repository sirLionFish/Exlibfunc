defmodule Exlibfunc.Repo.Migrations.CreatePublishers do
  use Ecto.Migration

  def change do
    create table(:publishers) do
      add :name, :string
      add :movie_id, references(:movies)
    end
    create unique_index(:publishers, [:movie_id])
  end
end
