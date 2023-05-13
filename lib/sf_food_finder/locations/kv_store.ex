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
    results = Agent.start_link(fn -> [] end, name: __MODULE__)

    "Mobile_Food_Facility_Permit.csv"
    |> File.stream!()
    |> CSV.decode!(headers: true)
    |> Stream.map(&Location.new/1)
    |> Enum.map(&insert_location/1)

    results
  end
end
