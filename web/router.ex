defmodule OvernightBackpacker.Router do
  use OvernightBackpacker.Web, :router

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

  scope "/", OvernightBackpacker do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    resources "/hikes", HikeController
  end

  # Other scopes may use custom stacks.
  # scope "/api", OvernightBackpacker do
  #   pipe_through :api
  # end
end
