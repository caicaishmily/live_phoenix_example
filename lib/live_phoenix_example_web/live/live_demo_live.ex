defmodule LivePhoenixExampleWeb.LiveDemoLive do
  use Phoenix.LiveView
  import Ecto.Query

  alias LivePhoenixExample.Schema.Girl
  alias LivePhoenixExample.Repo

  @topic "like"

  def render(assigns) do
    LivePhoenixExampleWeb.PageView.render("index.html", assigns)
  end

  def mount(_session, socket) do
    LivePhoenixExampleWeb.Endpoint.subscribe(@topic)
    {:ok, assign(socket, image_list: get_image_list())}
  end

  def handle_event("like", %{"id" => id}, socket) do
    with {:ok, _girl} <- update_like(id) do
      image_list = get_image_list()
      LivePhoenixExampleWeb.Endpoint.broadcast_from(self(), @topic, "like", %{image_list: image_list})
      {:noreply, assign(socket, image_list: image_list)}
    else
      {:error, error} ->
        {:noreply, assign(socket, %{error: error})}
    end
  end

  def handle_info(%{event: "like", payload: state}, socket) do
    {:noreply, assign(socket, state)}
  end

  defp update_like(id) do
    girl = Repo.get!(Girl, String.to_integer(id))
    girl = Ecto.Changeset.change girl, like: girl.like + 1

    case Repo.update girl do
      {:ok, girl}  -> {:ok, girl}
      {:error, _changeset} -> {:error, "更新失败"}
    end
  end

  defp get_image_list() do
    query = from(g in Girl, order_by: g.id)
    Repo.all(query)
  end
end
