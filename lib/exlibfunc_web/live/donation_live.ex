defmodule ExlibfuncWeb.DonationLive do
  use ExlibfuncWeb, :live_view

  alias Exlibfunc.Donations.Manager

  def mount(_params, _session, socket) do
    # donations = Manager.list_donations()
    # socket = assign(socket, donations: donations)

    {:ok, socket}
  end

  def handle_params(params, _uri, socket) do
    sort_by = (params["sort_by"] || "id") |> String.to_atom()
    sort_order = (params["sort_order"] || "asc") |> String.to_atom()

    options = %{sort_by: sort_by, sort_order: sort_order}

    donations = Manager.list_donations(options)

    socket = assign(socket, donations: donations, options: options)
    {:noreply, socket}
  end

  defp next_sort_order(order) do
    case order do
      :asc -> :desc
      :desc -> :asc
    end
  end
end
