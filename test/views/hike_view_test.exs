defmodule OvernightBackpacker.HikeViewTest do
  use OvernightBackpacker.ConnCase, async: true
  use ExUnit.Case, async: true

  @hike %OvernightBackpacker.Hike{elevation_gain: 100, elevation_loss: 200}

  test "formats elevation correctly" do
    assert OvernightBackpacker.HikeView.elevation(@hike) == "+ 100 / - 200"
  end
end
