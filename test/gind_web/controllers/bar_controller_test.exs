defmodule GindWeb.BarControllerTest do
  use GindWeb.ConnCase

  alias Gind.Venues

  @create_attrs %{address: "some address", country: "some country", name: "some name", phone: 42, website: "some website"}
  @update_attrs %{address: "some updated address", country: "some updated country", name: "some updated name", phone: 43, website: "some updated website"}
  @invalid_attrs %{address: nil, country: nil, name: nil, phone: nil, website: nil}

  def fixture(:bar) do
    {:ok, bar} = Venues.create_bar(@create_attrs)
    bar
  end

  describe "index" do
    test "lists all bars", %{conn: conn} do
      conn = get conn, bar_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Bars"
    end
  end

  describe "new bar" do
    test "renders form", %{conn: conn} do
      conn = get conn, bar_path(conn, :new)
      assert html_response(conn, 200) =~ "New Bar"
    end
  end

  describe "create bar" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, bar_path(conn, :create), bar: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == bar_path(conn, :show, id)

      conn = get conn, bar_path(conn, :show, id)
      assert html_response(conn, 200) =~ "Show Bar"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, bar_path(conn, :create), bar: @invalid_attrs
      assert html_response(conn, 200) =~ "New Bar"
    end
  end

  describe "edit bar" do
    setup [:create_bar]

    test "renders form for editing chosen bar", %{conn: conn, bar: bar} do
      conn = get conn, bar_path(conn, :edit, bar)
      assert html_response(conn, 200) =~ "Edit Bar"
    end
  end

  describe "update bar" do
    setup [:create_bar]

    test "redirects when data is valid", %{conn: conn, bar: bar} do
      conn = put conn, bar_path(conn, :update, bar), bar: @update_attrs
      assert redirected_to(conn) == bar_path(conn, :show, bar)

      conn = get conn, bar_path(conn, :show, bar)
      assert html_response(conn, 200) =~ "some updated address"
    end

    test "renders errors when data is invalid", %{conn: conn, bar: bar} do
      conn = put conn, bar_path(conn, :update, bar), bar: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit Bar"
    end
  end

  describe "delete bar" do
    setup [:create_bar]

    test "deletes chosen bar", %{conn: conn, bar: bar} do
      conn = delete conn, bar_path(conn, :delete, bar)
      assert redirected_to(conn) == bar_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, bar_path(conn, :show, bar)
      end
    end
  end

  defp create_bar(_) do
    bar = fixture(:bar)
    {:ok, bar: bar}
  end
end
