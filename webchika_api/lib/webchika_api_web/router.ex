defmodule WebchikaApiWeb.Router do
  use WebchikaApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", WebchikaApiWeb do
    get "/led/:action", RootController, :led
  end

  scope "/api", WebchikaApiWeb do
    pipe_through :api
  end
end
