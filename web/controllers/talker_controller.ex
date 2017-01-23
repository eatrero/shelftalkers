defmodule Shelftalkers.TalkerController do
  use Shelftalkers.Web, :controller

  alias Shelftalkers.Talker
  alias Shelftalkers.PdfGenerator

  def index(conn, _params) do
    talkers = Repo.all(Talker)
    render(conn, "index.html", talkers: talkers)
  end

  def all(conn, _params) do
    talkers = Repo.all(Talker)
    render conn, "index.json", talkers: talkers
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

  def pdf(conn, params) do
#    IO.puts(_params)

#    {:ok, filename} = PdfGenerator.generate "<html><div style='width:612px; border-bottom: 1px solid #000000'></div><h1> Selection #{params["selections"]} </h1></html>", page_size: "Letter", margin_left: "25.4", margin_right: "25.4"
    {:ok, filename} = PdfGenerator.pdf_generator(params["selections"])

    conn
    |> put_resp_content_type("application/pdf")
#    |> put_resp_header("content-disposition", "attachment; filename=\"/var/folders/96/v5g5_2nj06z3xk59kn6wtynh0000gn/T/8vl7KNVU.pdf\"")
    |> send_file(200, filename)
  end
end
