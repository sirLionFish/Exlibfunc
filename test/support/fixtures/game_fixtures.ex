defmodule Exlibfunc.GameFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Exlibfunc.Game` context.
  """

  @doc """
  Generate a games.
  """
  def games_fixture(attrs \\ %{}) do
    {:ok, games} =
      attrs
      |> Enum.into(%{
        appid: 42,
        name: "some name"
      })
      |> Exlibfunc.Game.create_games()

    games
  end
end
