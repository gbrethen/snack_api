defmodule SnacksApi.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      SnacksApi.Repo,
      # Start the Telemetry supervisor
      SnacksApiWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: SnacksApi.PubSub},
      # Start the Endpoint (http/https)
      SnacksApiWeb.Endpoint
      # Start a worker by calling: SnacksApi.Worker.start_link(arg)
      # {SnacksApi.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: SnacksApi.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    SnacksApiWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
