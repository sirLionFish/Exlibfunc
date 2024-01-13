defmodule Exlibfunc.Donations.Manager do

  import Ecto.Query, warn: false
  alias Exlibfunc.Repo

  alias Exlibfunc.Donations.Donation

  def list_donations do
    Repo.all(from d in Donation, order_by: [asc: d.id])
  end

  def get_manager!(id) do
    Donation
    |> Repo.get!(id)
  end

  def list_donations(opts) when is_map(opts) do
    from(Donation)
    |> sort(opts)
    |> paginate(opts)
    |> Repo.all()
  end

  defp sort(query, %{sort_by: sort_by, sort_order: sort_order}) do
    order_by(query, {^sort_order, ^sort_by})
  end

  defp sort(query, _otps), do: query

  defp paginate(query, %{page: page, per_page: per_page}) do
    offset = max((page - 1) * per_page, 0)

    query
    |> limit(^per_page)
    |> offset(^offset)
  end

  defp paginate(query, _opts), do: query

  def create_manager(attrs \\ %{}) do
    %Donation{}
    |> Donation.changeset(attrs)
    |> Repo.insert()
  end

  def update_manager(%Donation{} = manager, attrs) do
    manager
    |> Donation.changeset(attrs)
    |> Repo.update()
  end

  def delete_manager(%Donation{} = manager) do
    Repo.delete(manager)
  end

  def change_manager(%Donation{} = manager, attrs \\ %{}) do
    Donation.changeset(manager, attrs)
  end
end
