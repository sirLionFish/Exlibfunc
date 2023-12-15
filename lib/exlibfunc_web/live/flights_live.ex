defmodule ExlibfuncWeb.FlightsLive do
  use ExlibfuncWeb, :live_view

  alias Exlibfunc.Live.FlightLogs

  def mount(_, _, socket) do
    socket =
      assign(socket, airport: "", flights: [])

    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <h1>Find your flight</h1>
    <div id="flights">
      <form phx-submit="search">
        <input
          type="text"
          name="airport"
          value={@airport}
          placeholder="Airport Code"
          autofocus
          autocomplete="off"
        />
        <button>search</button>
      </form>

      <div class="flights">
        <ul>
        <%= for flight <- @flights do %>
          <li>
            <div class="first-line">
              <div class="number">
                Flight #<%= flight.number %>
              </div>
              <div class="origin-destination">
                <%= flight.origin %> to <%= flight.destination %>
              </div>
            </div>
            <div class="second-line">
              <div class="departs">
                Departs: <%= flight.departure_time %>
              </div>
              <div class="arrivals">
                Arrives: <%= flight.arrival_time %>
              </div>
            </div>
          </li>
        <% end %>
        </ul>
      </div>
    </div>
    """
  end

  def handle_event("search", %{"airport" => airport}, socket) do
    socket =
      assign(socket,
        airport: airport,
        flights: FlightLogs.search_by_airport(airport)
      )

    {:noreply, socket}
  end
end
