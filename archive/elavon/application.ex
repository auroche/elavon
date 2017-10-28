defmodule Elavon.Application do
  use Application

  # TODO: spawn a new child worker process each time a request is to be sent and block until response is received (or timeout)

  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  def start(_type, _args) do
    import Supervisor.Spec

    # Define workers and child supervisors to be supervised
    children = [

    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    # opts = [strategy: :one_for_one, name: Elavon.Supervisor]
    # Supervisor.start_link(children, opts)
  end
end
