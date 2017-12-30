defmodule Gind.VenuesTest do
  use Gind.DataCase

  alias Gind.Venues

  describe "bars" do
    alias Gind.Venues.Bar

    @valid_attrs %{address: "some address", country: "some country", name: "some name", phone: 42, website: "some website"}
    @update_attrs %{address: "some updated address", country: "some updated country", name: "some updated name", phone: 43, website: "some updated website"}
    @invalid_attrs %{address: nil, country: nil, name: nil, phone: nil, website: nil}

    def bar_fixture(attrs \\ %{}) do
      {:ok, bar} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Venues.create_bar()

      bar
    end

    test "list_bars/0 returns all bars" do
      bar = bar_fixture()
      assert Venues.list_bars() == [bar]
    end

    test "get_bar!/1 returns the bar with given id" do
      bar = bar_fixture()
      assert Venues.get_bar!(bar.id) == bar
    end

    test "create_bar/1 with valid data creates a bar" do
      assert {:ok, %Bar{} = bar} = Venues.create_bar(@valid_attrs)
      assert bar.address == "some address"
      assert bar.country == "some country"
      assert bar.name == "some name"
      assert bar.phone == 42
      assert bar.website == "some website"
    end

    test "create_bar/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Venues.create_bar(@invalid_attrs)
    end

    test "update_bar/2 with valid data updates the bar" do
      bar = bar_fixture()
      assert {:ok, bar} = Venues.update_bar(bar, @update_attrs)
      assert %Bar{} = bar
      assert bar.address == "some updated address"
      assert bar.country == "some updated country"
      assert bar.name == "some updated name"
      assert bar.phone == 43
      assert bar.website == "some updated website"
    end

    test "update_bar/2 with invalid data returns error changeset" do
      bar = bar_fixture()
      assert {:error, %Ecto.Changeset{}} = Venues.update_bar(bar, @invalid_attrs)
      assert bar == Venues.get_bar!(bar.id)
    end

    test "delete_bar/1 deletes the bar" do
      bar = bar_fixture()
      assert {:ok, %Bar{}} = Venues.delete_bar(bar)
      assert_raise Ecto.NoResultsError, fn -> Venues.get_bar!(bar.id) end
    end

    test "change_bar/1 returns a bar changeset" do
      bar = bar_fixture()
      assert %Ecto.Changeset{} = Venues.change_bar(bar)
    end
  end
end
