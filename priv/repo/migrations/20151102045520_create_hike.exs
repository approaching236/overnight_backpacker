defmodule OvernightBackpacker.Repo.Migrations.CreateHike do
  use Ecto.Migration

  def change do
    create table(:hikes) do
      add :name, :string
      add :description, :text
      add :directions, :text
      add :distance, :decimal
      add :trailhead_lat, :decimal
      add :trailhead_long, :decimal
      add :elevation_gain, :decimal
      add :elevation_loss, :decimal

      timestamps
    end

  end
end
