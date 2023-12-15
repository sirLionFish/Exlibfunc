defmodule Exlibfunc.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      ExlibfuncWeb.Telemetry,
      Exlibfunc.Repo,
      {DNSCluster, query: Application.get_env(:exlibfunc, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Exlibfunc.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Exlibfunc.Finch},
      # Start a worker by calling: Exlibfunc.Worker.start_link(arg)
      # {Exlibfunc.Worker, arg},
      # Start to serve requests, typically the last entry
      ExlibfuncWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Exlibfunc.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    ExlibfuncWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
