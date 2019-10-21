defmodule LivePhoenixExampleWeb.LiveDemoLive do
  use Phoenix.LiveView
  import Ecto.Query

  alias LivePhoenixExample.Schema.Girl
  alias LivePhoenixExample.Repo

  def render(assigns) do
    LivePhoenixExampleWeb.PageView.render("index.html", assigns)
  end

  def mount(_session, socket) do
    {:ok, assign(socket, image_list: get_image_list())}
  end

  def handle_event("test", %{"id" => id}, socket) do
    # TODO
    IO.inspect id
    {:noreply, assign(socket, %{})}
  end

  defp get_image_list() do
    query = from(g in Girl)
    Repo.all(query)
  end
end
