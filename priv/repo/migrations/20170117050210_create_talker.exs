defmodule Shelftalkers.Repo.Migrations.CreateTalker do
  use Ecto.Migration

  def change do
    create table(:talkers) do
      add :brewer, :string
      add :style, :string
      add :name, :string
      add :description, :string, size: 4096
      add :abv, :string
      add :rating, :float
      add :barcode, :string
      add :beer, :string
      add :location, :string
      add :sku, :string

      timestamps()
    end

  end
end
