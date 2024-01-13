defmodule Exlibfunc.DonationTest do
  use Exlibfunc.DataCase

  alias Exlibfunc.Donation

  describe "donations" do
    alias Exlibfunc.Donation.Manager

    import Exlibfunc.DonationFixtures

    @invalid_attrs %{days_until_expires: nil, item: nil, quantity: nil}

    test "list_donations/0 returns all donations" do
      manager = manager_fixture()
      assert Donation.list_donations() == [manager]
    end

    test "get_manager!/1 returns the manager with given id" do
      manager = manager_fixture()
      assert Donation.get_manager!(manager.id) == manager
    end

    test "create_manager/1 with valid data creates a manager" do
      valid_attrs = %{days_until_expires: 42, item: "some item", quantity: 42}

      assert {:ok, %Manager{} = manager} = Donation.create_manager(valid_attrs)
      assert manager.days_until_expires == 42
      assert manager.item == "some item"
      assert manager.quantity == 42
    end

    test "create_manager/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Donation.create_manager(@invalid_attrs)
    end

    test "update_manager/2 with valid data updates the manager" do
      manager = manager_fixture()
      update_attrs = %{days_until_expires: 43, item: "some updated item", quantity: 43}

      assert {:ok, %Manager{} = manager} = Donation.update_manager(manager, update_attrs)
      assert manager.days_until_expires == 43
      assert manager.item == "some updated item"
      assert manager.quantity == 43
    end

    test "update_manager/2 with invalid data returns error changeset" do
      manager = manager_fixture()
      assert {:error, %Ecto.Changeset{}} = Donation.update_manager(manager, @invalid_attrs)
      assert manager == Donation.get_manager!(manager.id)
    end

    test "delete_manager/1 deletes the manager" do
      manager = manager_fixture()
      assert {:ok, %Manager{}} = Donation.delete_manager(manager)
      assert_raise Ecto.NoResultsError, fn -> Donation.get_manager!(manager.id) end
    end

    test "change_manager/1 returns a manager changeset" do
      manager = manager_fixture()
      assert %Ecto.Changeset{} = Donation.change_manager(manager)
    end
  end
end
