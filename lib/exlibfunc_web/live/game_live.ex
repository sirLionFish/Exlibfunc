defmodule ExlibfuncWeb.GameLive do
  use ExlibfuncWeb, :live_view

  alias Exlibfunc.Games.Manager
  alias ExlibfuncWeb.GameComponent

  def mount(_params, _session, socket) do
    games = Manager.all_games()

    socket = stream(socket, :games, games)

    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <h1>Concurrent Players</h1>
    <div id="volunteer-checkin">
      <.live_component module={GameComponent} id={:new} />

      <div id="volunteers" phx-update="stream">
        <div
          :for={{game_id, game} <- @streams.games}
          class={"volunteer #{if game.status, do: "out"}"}
          id={game_id}
        >
          <div class="name">
            <%= game.name %>
          </div>
          <div class="phone">
            <%= game.appid %>
          </div>
          <div class="status">
            <button>
              <%= if game.status,
                do: "Check In",
                else: "Check Out" %>
            </button>
          </div>
        </div>
      </div>
    </div>
    """
  end

  def handle_info({:game_created, game}, socket) do
    {:noreply, stream_insert(socket, :games, game, at: 0)}
  end
end
