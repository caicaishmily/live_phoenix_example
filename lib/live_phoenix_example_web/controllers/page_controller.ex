defmodule LivePhoenixExampleWeb.PageController do
  use LivePhoenixExampleWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
