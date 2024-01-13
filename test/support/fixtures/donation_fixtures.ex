defmodule Exlibfunc.DonationFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Exlibfunc.Donation` context.
  """

  @doc """
  Generate a manager.
  """
  def manager_fixture(attrs \\ %{}) do
    {:ok, manager} =
      attrs
      |> Enum.into(%{
        days_until_expires: 42,
        item: "some item",
        quantity: 42
      })
      |> Exlibfunc.Donation.create_manager()

    manager
  end
end
