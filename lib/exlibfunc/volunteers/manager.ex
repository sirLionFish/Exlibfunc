defmodule Exlibfunc.Volunteers.Manager do
  import Ecto.Query, warn: false
  alias Exlibfunc.Repo
  alias Exlibfunc.Volunteers.Volunteer

  def list_volunteers do
    Repo.all(from v in Volunteer, order_by: [desc: v.id])
  end

  def get_volunteer!(id), do: Repo.get!(Volunteer, id)

  def create_volunteer(attrs \\ %{}) do
    %Volunteer{}
    |> Volunteer.changeset(attrs)
    |> Repo.insert()
  end

  def update_volunteer(%Volunteer{} = volunteer, attrs) do
    volunteer
    |> Volunteer.changeset(attrs)
    |> Repo.update()
  end

  def delete_volunteer(%Volunteer{} = volunteer) do
    Repo.delete(volunteer)
  end

  def change_volunteer(%Volunteer{} = volunteer, attrs \\ %{}) do
    Volunteer.changeset(volunteer, attrs)
  end
end
