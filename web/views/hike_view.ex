defmodule OvernightBackpacker.HikeView do
  use OvernightBackpacker.Web, :view

  @spec elevation(Hike) :: char_list
  def elevation(hike) do
    "+ #{hike.elevation_gain} / - #{hike.elevation_loss}"
  end

  @spec elevation(Hike) :: char_list
  def trailhead_lat_long(hike) do
    "(#{hike.trailhead_lat}, #{hike.trailhead_long})"
  end
end
