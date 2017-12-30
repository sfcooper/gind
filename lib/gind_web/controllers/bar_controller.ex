defmodule GindWeb.BarController do
  use GindWeb, :controller

  alias Gind.Venues
  alias Gind.Venues.Bar

  def index(conn, _params) do
    bars = Venues.list_bars()
    render(conn, "index.html", bars: bars)
  end

  def new(conn, _params) do
    changeset = Venues.change_bar(%Bar{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"bar" => bar_params}) do
    case Venues.create_bar(bar_params) do
      {:ok, bar} ->
        conn
        |> put_flash(:info, "Bar created successfully.")
        |> redirect(to: bar_path(conn, :show, bar))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    bar = Venues.get_bar!(id)
    render(conn, "show.html", bar: bar)
  end

  def edit(conn, %{"id" => id}) do
    bar = Venues.get_bar!(id)
    changeset = Venues.change_bar(bar)
    render(conn, "edit.html", bar: bar, changeset: changeset)
  end

  def update(conn, %{"id" => id, "bar" => bar_params}) do
    bar = Venues.get_bar!(id)

    case Venues.update_bar(bar, bar_params) do
      {:ok, bar} ->
        conn
        |> put_flash(:info, "Bar updated successfully.")
        |> redirect(to: bar_path(conn, :show, bar))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", bar: bar, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    bar = Venues.get_bar!(id)
    {:ok, _bar} = Venues.delete_bar(bar)

    conn
    |> put_flash(:info, "Bar deleted successfully.")
    |> redirect(to: bar_path(conn, :index))
  end
end
