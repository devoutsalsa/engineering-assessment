defmodule Mix.Tasks.SfFoodFinder do
  @moduledoc """
  list locations: mix sf_food_finder list locations
  """
  @shortdoc "SF Food Finder command line interface"

  use Mix.Task
  alias SFFoodFinder.Locations.KVStore

  @impl Mix.Task
  def run(args) do
    Application.ensure_all_started(:sf_food_finder)

    # ["get", "locations" | _])
    Mix.shell.error "poop"
  end
end
