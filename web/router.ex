defmodule Calcutta.Router do
  use Calcutta.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Guardian.Plug.VerifySession
    plug Guardian.Plug.LoadResource
  end

  pipeline :browser_auth do
    plug Guardian.Plug.VerifySession
    plug Guardian.Plug.EnsureAuthenticated, handler: Calcutta.Token
    plug Guardian.Plug.LoadResource
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Calcutta do
    pipe_through :browser # Use the default browser stack
    get "/", PageController, :index
    resources "/users", UserController, only: [:new, :create]
    resources "/sessions", SessionController, only: [:new, :create, :delete]
  end

  scope "/", Calcutta do
    pipe_through [:browser, :browser_auth]
    resources "/users", UserController, only: [:show, :edit, :update]
    resources "/leagues", LeagueController, only: [:new, :create]
  end

  # Other scopes may use custom stacks.
  # scope "/api", Calcutta do
  #   pipe_through :api
  # end
end
