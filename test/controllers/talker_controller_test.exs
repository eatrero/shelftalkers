defmodule Shelftalkers.TalkerControllerTest do
  use Shelftalkers.ConnCase

  alias Shelftalkers.Talker
  @valid_attrs %{abv: "120.5", brewer: "some content", description: "some content", name: "some content", rating: "120.5", style: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, talker_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing talkers"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, talker_path(conn, :new)
    assert html_response(conn, 200) =~ "New talker"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, talker_path(conn, :create), talker: @valid_attrs
    assert redirected_to(conn) == talker_path(conn, :index)
    assert Repo.get_by(Talker, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, talker_path(conn, :create), talker: @invalid_attrs
    assert html_response(conn, 200) =~ "New talker"
  end

  test "shows chosen resource", %{conn: conn} do
    talker = Repo.insert! %Talker{}
    conn = get conn, talker_path(conn, :show, talker)
    assert html_response(conn, 200) =~ "Show talker"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, talker_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    talker = Repo.insert! %Talker{}
    conn = get conn, talker_path(conn, :edit, talker)
    assert html_response(conn, 200) =~ "Edit talker"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    talker = Repo.insert! %Talker{}
    conn = put conn, talker_path(conn, :update, talker), talker: @valid_attrs
    assert redirected_to(conn) == talker_path(conn, :show, talker)
    assert Repo.get_by(Talker, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    talker = Repo.insert! %Talker{}
    conn = put conn, talker_path(conn, :update, talker), talker: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit talker"
  end

  test "deletes chosen resource", %{conn: conn} do
    talker = Repo.insert! %Talker{}
    conn = delete conn, talker_path(conn, :delete, talker)
    assert redirected_to(conn) == talker_path(conn, :index)
    refute Repo.get(Talker, talker.id)
  end
end
