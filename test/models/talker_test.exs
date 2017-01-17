defmodule Shelftalkers.TalkerTest do
  use Shelftalkers.ModelCase

  alias Shelftalkers.Talker

  @valid_attrs %{abv: "120.5", brewer: "some content", description: "some content", name: "some content", rating: "120.5", style: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Talker.changeset(%Talker{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Talker.changeset(%Talker{}, @invalid_attrs)
    refute changeset.valid?
  end
end
