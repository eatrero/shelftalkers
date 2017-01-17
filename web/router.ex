defmodule Shelftalkers.Router do
  use Shelftalkers.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Shelftalkers do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index

    resources "/talkers", TalkerController
  end

  # Other scopes may use custom stacks.
  scope "/api", Shelftalkers do
    pipe_through :api
    get "/talkers", TalkerController, :all
  end

end
