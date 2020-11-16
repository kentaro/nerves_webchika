defmodule WebchikaApiWeb.RootController do
  use WebchikaApiWeb, :controller

  def led(conn, params) do
    action = params["action"]
    res = GenServer.cast(WebchikaFirmware.Worker, String.to_atom(action))
    text(conn, res)
  end
end
