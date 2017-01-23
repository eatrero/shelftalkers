defmodule Shelftalkers.Talker do
  use Shelftalkers.Web, :model

  schema "talkers" do
    field :brewer, :string
    field :style, :string
    field :name, :string
    field :description, :string
    field :abv, :float
    field :rating, :float

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:brewer, :style, :name, :description, :abv, :rating, :id])
    |> validate_required([:brewer, :style, :name, :description, :abv, :rating])
  end
end
