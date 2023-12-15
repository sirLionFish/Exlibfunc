defmodule ExlibfuncWeb.LightLive do
  use ExlibfuncWeb, :live_view

  def mount(_arge, _session, socket) do
    socket = assign(socket, brightness: 10)
    {:ok, socket}
  end

  def render(assigns) do
       ~H"""
      <h1>light in front of the house</h1>
      <div id="light">
        <div class="meter">
          <span style={"width: #{@brightness}%"}>
            <%= @brightness %>%
          </span>
        </div>
        <button phx-click="up">
         increase by 10
        </button>
        <button phx-click="on">
         100
        </button>
        <button phx-click="off">
          0
        </button>
        <button phx-click="down">
         decrease by 10
        </button>
      </div>
    """
  end

  def handle_event("on", _unsigned_params, socket) do
    socket = assign(socket, brightness: 100)
    {:noreply, socket}
  end

  def handle_event("up", _, socket) do
    brightness = socket.assigns.brightness + 10
    socket = assign(socket, brightness: brightness)
    {:noreply, socket}
  end

  def handle_event("down", _unsigned_params, socket) do
    brightness = socket.assigns.brightness - 10
    socket = assign(socket, brightness: brightness)
    {:noreply, socket}
  end

  def handle_event("off", _unsigned_params, socket) do
    socket = assign(socket, brightness: 0)
    {:noreply, socket}
  end
end
