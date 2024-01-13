defmodule Exlibfunc.Games.Manager do
  import Ecto.Query, warn: false
  alias Exlibfunc.Repo
  alias Exlibfunc.Games.Game

  def all_games, do: Repo.all(from g in Game, order_by: [desc: g.id])
  def get_game!(id), do: Repo.get!(Game, id)

  def create_game(attrs \\ %{}) do
    %Game{}
    |> Game.changeset(attrs)
    |> Repo.insert()
  end

  def update_game(%Game{} = game, attrs) do
    game
    |> Game.changeset(attrs)
    |> Repo.update()
  end

  def delete_game(%Game{} = game) do
    Repo.delete(game)
  end

  def change_game(%Game{} = game, attrs \\ %{}) do
    Game.changeset(game, attrs)
  end

  def get_appid_by_id(game_id) do
    game_id
    |> get_game!()
    |> Map.get(:appid)
  end

  def get_concurrent_players(game_id) do
    appid = get_appid_by_id(game_id)

    "https://api.steampowered.com/ISteamUserStats/GetNumberOfCurrentPlayers/v1/?appid=#{appid}"
    |> HTTPoison.get!()
    |> Map.get(:body)
    |> Jason.decode!()
    |> get_in(["response", "player_count"])
  end
end
