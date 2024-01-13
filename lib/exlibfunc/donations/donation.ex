defmodule Exlibfunc.Donations.Donation do
  use Ecto.Schema
  import Ecto.Changeset

  schema "donations" do
    field :days_until_expires, :integer
    field :item, :string
    field :quantity, :integer

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(manager, attrs) do
    manager
    |> cast(attrs, [:item, :quantity, :days_until_expires])
    |> validate_required([:item, :quantity, :days_until_expires])
  end
end
