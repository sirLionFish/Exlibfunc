defmodule Exlibfunc.Games.Game do
  use Ecto.Schema
  import Ecto.Changeset

  schema "games" do
    field :appid, :integer
    field :name, :string
    field :status, :boolean, default: true

    timestamps(type: :utc_datetime)
  end


  @doc false
  def changeset(games, attrs) do
    games
    |> cast(attrs, [:appid, :name, :status])
    |> validate_required([:appid, :name, :status])
    |> validate_length(:name, min: 2, max: 100)
    |> validate_integer(:appid)
  end

  defp validate_integer(changeset, field) do
    if is_integer(get_field(changeset, field)) do
      changeset
    else
      add_error(changeset, field, "Should be an Appid")
    end
  end
end
