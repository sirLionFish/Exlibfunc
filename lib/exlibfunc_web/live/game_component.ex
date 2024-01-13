defmodule ExlibfuncWeb.GameComponent do
  use ExlibfuncWeb, :live_component
  alias Exlibfunc.Games.Manager
  alias Exlibfunc.Games.Game

  def mount(socket) do
    changeset = Manager.change_game(%Game{})

    {:ok, assign(socket, :form, to_form(changeset))}
  end

  def render(assigns) do
    ~H"""
      <div>
        <.form for={@form} phx-submit="save" phx-change="validate" phx-target={@myself}>
          <.input
            field={@form[:name]}
            placeholder="Name"
            autocomplete="off"
            phx-debounce="2000"
          />
          <.input
            field={@form[:appid]}
            type="tel"
            placeholder="Appid"
            autocomplete="off"
            phx-debounce="blur"
          />
          <.button phx-disable-with="Saving...">
            Check In
          </.button>
        </.form>
      </div>
    """
  end

  def handle_event("validate", %{"game" => game_params}, socket) do
    changeset =
      %Game{}
      |> Manager.change_game(game_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :form, to_form(changeset))}
  end

  def handle_event("save", %{"game" => game_params}, socket) do
    case Manager.create_game(game_params) do
      {:ok, game} ->
        send(self(), {:game_created, game})

        changeset = Manager.change_game(%Game{})

        {:noreply, assign(socket, :form, to_form(changeset))}

      {:error, changeset} ->
        {:noreply, assign(socket, :form, to_form(changeset))}
    end
  end
end
