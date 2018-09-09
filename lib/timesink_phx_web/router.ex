defmodule TimesinkPhxWeb.Router do
  use TimesinkPhxWeb, :router

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

  scope "/", TimesinkPhxWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  scope "/api", TimesinkPhxWeb do
    pipe_through :api

    resources "/people", PersonController, except: [:new, :edit]
  end
end
