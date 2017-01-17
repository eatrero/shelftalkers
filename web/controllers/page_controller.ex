defmodule Shelftalkers.PageController do
  use Shelftalkers.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
