defmodule ExlibfuncWeb.SalesLive do
  use ExlibfuncWeb, :live_view
  alias Exlibfunc.Live.Sales

  def mount(_params, _sesson, socket) do
    if connected?(socket) do
      :timer.send_interval(1000, self(), :tick)
    end
    {:ok, assign_stats(socket)}
  end

  def render(assigns) do
    ~H"""
      <h1>Snappy Sales</h1>
      <div id="sales">
        <div class="stats">
          <div class="state">
            <span class="value">
              <%= @new_orders %>
            </span>
            <span class="label">
              New Orders
            </span>
          </div>
          <div class="state">
            <span class="value">
              <%= @sales_amount %>
            </span>
            <span class="label">
              Sales Amount
            </span>
          </div>
          <div class="state">
            <span class="value">
              <%= @satisfaction %>
            </span>
            <span class="label">
              Satisfaction
            </span>
          </div>
        </div>
        <button phx-click="refresh">
          Refresh
        </button>
      </div>
    """
  end

  def handle_event("refresh", _, socket) do
    {:noreply, assign_stats(socket)}
  end

  def handle_info(:tick, socket) do
    {:noreply, assign_stats(socket)}
  end

  defp assign_stats(socket) do
    assign(socket,
      new_orders: Sales.new_orders,
      sales_amount: Sales.sales_amount,
      satisfaction: Sales.satisfaction
    )
  end
end
