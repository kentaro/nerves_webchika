defmodule WebchikaFirmware.Worker do
  use GenServer
  require Logger

  @duration 500

  def start_link(state \\ %{}) do
    GenServer.start_link(__MODULE__, state, name: __MODULE__)
  end

  def init(state) do
    {:ok, state}
  end

  def handle_cast(:start_blinking, state) do
    Logger.debug("Starting blinking")
    spawn_link(fn -> blinking() end) # kill the spawned process when this process is killed
    {:noreply, state}
  end

  def handle_cast(:stop_blinking, state) do
    Logger.debug("Stopping blinking")
    Process.exit(self(), :kill) # restart the process
    {:noreply, state}
  end

  def handle_cast(:turn_on, state) do
    GenServer.cast(WebchikaFirmware.Led, :turn_on)
    {:noreply, state}
  end

  def handle_cast(:turn_off, state) do
    GenServer.cast(WebchikaFirmware.Led, :turn_off)
    {:noreply, state}
  end

  defp blinking() do
    GenServer.cast(WebchikaFirmware.Led, :turn_on)
    Process.sleep(@duration)
    GenServer.cast(WebchikaFirmware.Led, :turn_off)
    Process.sleep(@duration)
    blinking()
  end
end
