defmodule Exlibfunc.GameTest do
  use Exlibfunc.DataCase

  alias Exlibfunc.Game

  describe "games" do
    alias Exlibfunc.Game.Games

    import Exlibfunc.GameFixtures

    @invalid_attrs %{appid: nil, name: nil}

    test "list_games/0 returns all games" do
      games = games_fixture()
      assert Game.list_games() == [games]
    end

    test "get_games!/1 returns the games with given id" do
      games = games_fixture()
      assert Game.get_games!(games.id) == games
    end

    test "create_games/1 with valid data creates a games" do
      valid_attrs = %{appid: 42, name: "some name"}

      assert {:ok, %Games{} = games} = Game.create_games(valid_attrs)
      assert games.appid == 42
      assert games.name == "some name"
    end

    test "create_games/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Game.create_games(@invalid_attrs)
    end

    test "update_games/2 with valid data updates the games" do
      games = games_fixture()
      update_attrs = %{appid: 43, name: "some updated name"}

      assert {:ok, %Games{} = games} = Game.update_games(games, update_attrs)
      assert games.appid == 43
      assert games.name == "some updated name"
    end

    test "update_games/2 with invalid data returns error changeset" do
      games = games_fixture()
      assert {:error, %Ecto.Changeset{}} = Game.update_games(games, @invalid_attrs)
      assert games == Game.get_games!(games.id)
    end

    test "delete_games/1 deletes the games" do
      games = games_fixture()
      assert {:ok, %Games{}} = Game.delete_games(games)
      assert_raise Ecto.NoResultsError, fn -> Game.get_games!(games.id) end
    end

    test "change_games/1 returns a games changeset" do
      games = games_fixture()
      assert %Ecto.Changeset{} = Game.change_games(games)
    end
  end
end
