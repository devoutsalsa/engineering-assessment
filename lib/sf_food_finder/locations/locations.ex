defmodule SFFoodFinder do
  alias SFFoodFinder.Locations.KVStore

  def get_locations do
    KVStore.get_locations()
  end
end
