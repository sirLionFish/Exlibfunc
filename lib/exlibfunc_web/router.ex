defmodule ExlibfuncWeb.Router do
  use ExlibfuncWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {ExlibfuncWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", ExlibfuncWeb do
    pipe_through :browser

    get "/", PageController, :home

    live "/live", PageLive
    live "/light", LightLive
    live "/sandbox", SandboxLive
    live "/sales", SalesLive
    live "/flights", FlightsLive
    live "/servers", ServerLive
  end

  if Application.compile_env(:exlibfunc, :dev_routes) do
    import Phoenix.LiveDashboard.Router
    scope "/dev" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: ExlibfuncWeb.Telemetry
      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
