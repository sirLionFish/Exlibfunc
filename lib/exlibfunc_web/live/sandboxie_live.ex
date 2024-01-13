defmodule ExlibfuncWeb.SandboxLive do
  use ExlibfuncWeb, :live_view
  alias Exlibfunc.Live.Sandbox

  def mount(_params, _session, socket) do
    socket =
      assign(socket,
        length: "0",
        width: "0",
        depth: "0",
        weight: 0.0,
        price: nil
      )
    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
      <h1>Build A Sandbox</h1>
      <div id="sandbox">
        <form phx-change="calculate" phx-submit="get-quote">
          <div class="fields">
            <div>
              <label for="length">length</label>
              <div>
                <input type="number" name="length" value={@length} />
                <span class="unit">feet</span>
              </div>
            </div>
            <div>
              <label for="width">width</label>
              <div>
                <input type="number" name="width" value={@width} />
                <span class="unit">feet</span>
              </div>
            </div>
            <div>
              <label for="depth">depth</label>
              <div>
                <input type="number" name="depth" value={@depth} />
                <span class="unit">inches</span>
              </div>
            </div>
            <div class="weight">
              You want <%= @weight %> pounds of sand
            </div>
            <button type="submit">
              Get a Quote
            </button>
          </div>
        </form>
        <div :if={@price} class="quote">
          Get your sand for <%= @price %>
        </div>
      </div>
    """
  end

  def handle_event("calculate", params, socket) do
    %{"length" => l, "width" => w, "depth" => d} = params
    weight = Sandbox.calculate_weight(l, w, d)

    socket =
      assign(socket, length: l, width: w, depth: d, weight: weight, price: nil)

    {:noreply, socket}
  end

  def handle_event("get-quote", _unsigned_params, socket) do
    price = Sandbox.calculate_price(socket.assigns.weight)
    socket = assign(socket, price: price)

    {:noreply, socket}
  end
end
