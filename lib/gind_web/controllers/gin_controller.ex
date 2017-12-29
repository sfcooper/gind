defmodule GindWeb.GinController do
  use GindWeb, :controller

  alias Gind.Drinks
  alias Gind.Drinks.Gin

  def index(conn, _params) do
    gins = Drinks.list_gins()
    render(conn, "index.html", gins: gins)
  end

  def new(conn, _params) do
    changeset = Drinks.change_gin(%Gin{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"gin" => gin_params}) do
    case Drinks.create_gin(gin_params) do
      {:ok, gin} ->
        conn
        |> put_flash(:info, "Gin created successfully.")
        |> redirect(to: gin_path(conn, :show, gin))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    gin = Drinks.get_gin!(id)
    render(conn, "show.html", gin: gin)
  end

  def edit(conn, %{"id" => id}) do
    gin = Drinks.get_gin!(id)
    changeset = Drinks.change_gin(gin)
    render(conn, "edit.html", gin: gin, changeset: changeset)
  end

  def update(conn, %{"id" => id, "gin" => gin_params}) do
    gin = Drinks.get_gin!(id)

    case Drinks.update_gin(gin, gin_params) do
      {:ok, gin} ->
        conn
        |> put_flash(:info, "Gin updated successfully.")
        |> redirect(to: gin_path(conn, :show, gin))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", gin: gin, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    gin = Drinks.get_gin!(id)
    {:ok, _gin} = Drinks.delete_gin(gin)

    conn
    |> put_flash(:info, "Gin deleted successfully.")
    |> redirect(to: gin_path(conn, :index))
  end
end
