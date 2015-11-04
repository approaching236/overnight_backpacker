defmodule OvernightBackpacker.Hike do
  use OvernightBackpacker.Web, :model

  schema "hikes" do
    field :name, :string
    field :description, :string
    field :directions, :string
    field :distance, :decimal
    field :trailhead_lat, :decimal
    field :trailhead_long, :decimal
    field :elevation_gain, :decimal
    field :elevation_loss, :decimal

    timestamps
  end

  @required_fields ~w(name description directions distance trailhead_lat trailhead_long elevation_gain elevation_loss)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
