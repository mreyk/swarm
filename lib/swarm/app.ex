defmodule Swarm.App do
  @moduledoc false
  use Supervisor

  def start_link() do
    Supervisor.start_link(__MODULE__, [], name: __MODULE__)
  end

  def init(_) do
    children = [
      %{id: Task.Supervisor, start: {Task.Supervisor, :start_link, [[name: Swarm.TaskSupervisor]]}, type: :supervisor},
      %{id: Swarm.Registry, start: {Swarm.Registry, :start_link, []}},
      %{id: Swarm.Tracker, start: {Swarm.Tracker, :start_link, []}}
    ]

    Supervisor.init(children, strategy: :one_for_one)
  end
end
