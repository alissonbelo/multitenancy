defmodule Multitenancy.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      MultitenancyWeb.Telemetry,
      # Start the Ecto repository
      Multitenancy.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Multitenancy.PubSub},
      # Start Finch
      {Finch, name: Multitenancy.Finch},
      # Start the Endpoint (http/https)
      MultitenancyWeb.Endpoint
      # Start a worker by calling: Multitenancy.Worker.start_link(arg)
      # {Multitenancy.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Multitenancy.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    MultitenancyWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
