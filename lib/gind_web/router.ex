defmodule GindWeb.Router do
  use GindWeb, :router

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

  scope "/", GindWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/about", AboutController, :index
    get "/post", PostController, :index
    get "/gin", GinController, :index
    get "/bar", BarController, :index
    get "/jury", JuryController, :index
    get "/admin", AdminController, :index
    get "/suspects", SuspectsController, :index
    resources "/posts", PostController
    resources "/gins", GinController
    resources "/bars", BarController
    resources "/users", UserController
  end

  # Other scopes may use custom stacks.
  # scope "/api", GindWeb do
  #   pipe_through :api
  # end
end
