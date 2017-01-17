defmodule Shelftalkers.TalkerController do
  use Shelftalkers.Web, :controller

  alias Shelftalkers.Talker

  def index(conn, _params) do
    talkers = Repo.all(Talker)
    render(conn, "index.html", talkers: talkers)
  end

  def all(conn, _params) do
    talkers = Repo.all(Talker)
    render(conn, "index.json", talkers: talkers)
  end

  def new(conn, _params) do
    changeset = Talker.changeset(%Talker{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"talker" => talker_params}) do
    changeset = Talker.changeset(%Talker{}, talker_params)

    case Repo.insert(changeset) do
      {:ok, _talker} ->
        conn
        |> put_flash(:info, "Talker created successfully.")
        |> redirect(to: talker_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    talker = Repo.get!(Talker, id)
    render(conn, "show.html", talker: talker)
  end

  def edit(conn, %{"id" => id}) do
    talker = Repo.get!(Talker, id)
    changeset = Talker.changeset(talker)
    render(conn, "edit.html", talker: talker, changeset: changeset)
  end

  def update(conn, %{"id" => id, "talker" => talker_params}) do
    talker = Repo.get!(Talker, id)
    changeset = Talker.changeset(talker, talker_params)

    case Repo.update(changeset) do
      {:ok, talker} ->
        conn
        |> put_flash(:info, "Talker updated successfully.")
        |> redirect(to: talker_path(conn, :show, talker))
      {:error, changeset} ->
        render(conn, "edit.html", talker: talker, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    talker = Repo.get!(Talker, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(talker)

    conn
    |> put_flash(:info, "Talker deleted successfully.")
    |> redirect(to: talker_path(conn, :index))
  end
end
