defmodule Barebone.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Starts a worker by calling: Barebone.Worker.start_link(arg)
      # {Barebone.Worker, arg}
      {Bandit, plug: Barebone.Router},
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Barebone.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
