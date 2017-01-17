defmodule Shelftalkers.Repo.Migrations.CreateTalker do
  use Ecto.Migration

  def change do
    create table(:talkers) do
      add :brewer, :string
      add :style, :string
      add :name, :string
      add :description, :string, size: 4096
      add :abv, :float
      add :rating, :float

      timestamps()
    end

  end
end
