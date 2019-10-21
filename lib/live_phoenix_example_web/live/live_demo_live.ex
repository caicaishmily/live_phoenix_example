defmodule LivePhoenixExampleWeb.LiveDemoLive do
  use Phoenix.LiveView

  def render(assigns) do
    LivePhoenixExampleWeb.PageView.render("index.html", assigns)
  end

  def mount(_session, socket) do
    {:ok, assign(socket, deploy_step: "Ready!")}
  end

  def handle_event("test", _, socket) do
    IO.inspect "+++++++++++++"
  end
end
