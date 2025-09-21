defmodule LiveSketchWeb.Router do
  use LiveSketchWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {LiveSketchWeb.LayoutView, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", LiveSketchWeb do
    pipe_through :browser

    live "/", SketchLive, :index
  end

  # Note: For channels, handled in socket
end