defmodule SFFoodFinder.Locations.KVStore do
  use Agent
  alias SFFoodFinder.Locations.Location

  def get_locations() do
    Agent.get(__MODULE__, fn locations -> locations end)
  end

  def insert_location(%Location{} = location) do
    Agent.update(__MODULE__, fn locations -> [location | locations] end)
  end

  def start_link(_) do
    Agent.start_link(fn -> [] end, name: __MODULE__)
  end
end
