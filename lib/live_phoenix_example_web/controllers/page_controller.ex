defmodule LivePhoenixExampleWeb.PageController do
  use LivePhoenixExampleWeb, :controller

  alias Phoenix.LiveView
  def index(conn, _params) do
    LiveView.Controller.live_render(conn, LivePhoenixExampleWeb.LiveDemoLive, session: %{})
  end
end
