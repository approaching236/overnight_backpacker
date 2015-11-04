defmodule OvernightBackpacker.HikeTest do
  use OvernightBackpacker.ModelCase

  alias OvernightBackpacker.Hike

  @valid_attrs %{description: "some content", directions: "some content", distance: "120.5", elevation_gain: "120.5", elevation_loss: "120.5", name: "some content", trailhead_lat: "120.5", trailhead_long: "120.5"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Hike.changeset(%Hike{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Hike.changeset(%Hike{}, @invalid_attrs)
    refute changeset.valid?
  end
end
