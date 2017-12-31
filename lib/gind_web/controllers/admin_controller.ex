defmodule GindWeb.AdminController do
  use GindWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
