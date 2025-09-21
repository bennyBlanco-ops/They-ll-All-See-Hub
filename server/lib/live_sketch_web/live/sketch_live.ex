defmodule LiveSketchWeb.SketchLive do
  use LiveSketchWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, session_id: "default")}
  end

  # For simplicity, using LiveView, but channels for real-time
  # Actual real-time via JS socket in client
end