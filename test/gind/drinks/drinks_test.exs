defmodule Gind.DrinksTest do
  use Gind.DataCase

  alias Gind.Drinks

  describe "gins" do
    alias Gind.Drinks.Gin

    @valid_attrs %{brand: "some brand", name: "some name", slug: "some slug", status: "some status", text: "some text"}
    @update_attrs %{brand: "some updated brand", name: "some updated name", slug: "some updated slug", status: "some updated status", text: "some updated text"}
    @invalid_attrs %{brand: nil, name: nil, slug: nil, status: nil, text: nil}

    def gin_fixture(attrs \\ %{}) do
      {:ok, gin} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Drinks.create_gin()

      gin
    end

    test "list_gins/0 returns all gins" do
      gin = gin_fixture()
      assert Drinks.list_gins() == [gin]
    end

    test "get_gin!/1 returns the gin with given id" do
      gin = gin_fixture()
      assert Drinks.get_gin!(gin.id) == gin
    end

    test "create_gin/1 with valid data creates a gin" do
      assert {:ok, %Gin{} = gin} = Drinks.create_gin(@valid_attrs)
      assert gin.brand == "some brand"
      assert gin.name == "some name"
      assert gin.slug == "some slug"
      assert gin.status == "some status"
      assert gin.text == "some text"
    end

    test "create_gin/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Drinks.create_gin(@invalid_attrs)
    end

    test "update_gin/2 with valid data updates the gin" do
      gin = gin_fixture()
      assert {:ok, gin} = Drinks.update_gin(gin, @update_attrs)
      assert %Gin{} = gin
      assert gin.brand == "some updated brand"
      assert gin.name == "some updated name"
      assert gin.slug == "some updated slug"
      assert gin.status == "some updated status"
      assert gin.text == "some updated text"
    end

    test "update_gin/2 with invalid data returns error changeset" do
      gin = gin_fixture()
      assert {:error, %Ecto.Changeset{}} = Drinks.update_gin(gin, @invalid_attrs)
      assert gin == Drinks.get_gin!(gin.id)
    end

    test "delete_gin/1 deletes the gin" do
      gin = gin_fixture()
      assert {:ok, %Gin{}} = Drinks.delete_gin(gin)
      assert_raise Ecto.NoResultsError, fn -> Drinks.get_gin!(gin.id) end
    end

    test "change_gin/1 returns a gin changeset" do
      gin = gin_fixture()
      assert %Ecto.Changeset{} = Drinks.change_gin(gin)
    end
  end
end
