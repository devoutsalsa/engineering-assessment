defmodule SFFoodFinder.Locations.Bootstrapper do
  use Task
  alias SFFoodFinder.Locations.KVStore
  alias SFFoodFinder.Locations.Location

  def start_link(_) do
    Task.start_link(__MODULE__, :run, [])
  end

  def run() do
    "Mobile_Food_Facility_Permit.csv"
    |> File.stream!()
    |> CSV.decode!(headers: true)
    |> Stream.map(&Location.new/1)
    |> Enum.map(&KVStore.insert_location/1)
  end
end
