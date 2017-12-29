defmodule GindWeb.GinControllerTest do
  use GindWeb.ConnCase

  alias Gind.Drinks

  @create_attrs %{brand: "some brand", name: "some name", slug: "some slug", status: "some status", text: "some text"}
  @update_attrs %{brand: "some updated brand", name: "some updated name", slug: "some updated slug", status: "some updated status", text: "some updated text"}
  @invalid_attrs %{brand: nil, name: nil, slug: nil, status: nil, text: nil}

  def fixture(:gin) do
    {:ok, gin} = Drinks.create_gin(@create_attrs)
    gin
  end

  describe "index" do
    test "lists all gins", %{conn: conn} do
      conn = get conn, gin_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Gins"
    end
  end

  describe "new gin" do
    test "renders form", %{conn: conn} do
      conn = get conn, gin_path(conn, :new)
      assert html_response(conn, 200) =~ "New Gin"
    end
  end

  describe "create gin" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, gin_path(conn, :create), gin: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == gin_path(conn, :show, id)

      conn = get conn, gin_path(conn, :show, id)
      assert html_response(conn, 200) =~ "Show Gin"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, gin_path(conn, :create), gin: @invalid_attrs
      assert html_response(conn, 200) =~ "New Gin"
    end
  end

  describe "edit gin" do
    setup [:create_gin]

    test "renders form for editing chosen gin", %{conn: conn, gin: gin} do
      conn = get conn, gin_path(conn, :edit, gin)
      assert html_response(conn, 200) =~ "Edit Gin"
    end
  end

  describe "update gin" do
    setup [:create_gin]

    test "redirects when data is valid", %{conn: conn, gin: gin} do
      conn = put conn, gin_path(conn, :update, gin), gin: @update_attrs
      assert redirected_to(conn) == gin_path(conn, :show, gin)

      conn = get conn, gin_path(conn, :show, gin)
      assert html_response(conn, 200) =~ "some updated brand"
    end

    test "renders errors when data is invalid", %{conn: conn, gin: gin} do
      conn = put conn, gin_path(conn, :update, gin), gin: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit Gin"
    end
  end

  describe "delete gin" do
    setup [:create_gin]

    test "deletes chosen gin", %{conn: conn, gin: gin} do
      conn = delete conn, gin_path(conn, :delete, gin)
      assert redirected_to(conn) == gin_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, gin_path(conn, :show, gin)
      end
    end
  end

  defp create_gin(_) do
    gin = fixture(:gin)
    {:ok, gin: gin}
  end
end
