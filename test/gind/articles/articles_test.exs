defmodule Gind.ArticlesTest do
  use Gind.DataCase

  alias Gind.Articles

  describe "posts" do
    alias Gind.Articles.Post

    @valid_attrs %{slug: "some slug", snippet: "some snippet", text: "some text", title: "some title"}
    @update_attrs %{slug: "some updated slug", snippet: "some updated snippet", text: "some updated text", title: "some updated title"}
    @invalid_attrs %{slug: nil, snippet: nil, text: nil, title: nil}

    def post_fixture(attrs \\ %{}) do
      {:ok, post} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Articles.create_post()

      post
    end

    test "list_posts/0 returns all posts" do
      post = post_fixture()
      assert Articles.list_posts() == [post]
    end

    test "get_post!/1 returns the post with given id" do
      post = post_fixture()
      assert Articles.get_post!(post.id) == post
    end

    test "create_post/1 with valid data creates a post" do
      assert {:ok, %Post{} = post} = Articles.create_post(@valid_attrs)
      assert post.slug == "some slug"
      assert post.snippet == "some snippet"
      assert post.text == "some text"
      assert post.title == "some title"
    end

    test "create_post/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Articles.create_post(@invalid_attrs)
    end

    test "update_post/2 with valid data updates the post" do
      post = post_fixture()
      assert {:ok, post} = Articles.update_post(post, @update_attrs)
      assert %Post{} = post
      assert post.slug == "some updated slug"
      assert post.snippet == "some updated snippet"
      assert post.text == "some updated text"
      assert post.title == "some updated title"
    end

    test "update_post/2 with invalid data returns error changeset" do
      post = post_fixture()
      assert {:error, %Ecto.Changeset{}} = Articles.update_post(post, @invalid_attrs)
      assert post == Articles.get_post!(post.id)
    end

    test "delete_post/1 deletes the post" do
      post = post_fixture()
      assert {:ok, %Post{}} = Articles.delete_post(post)
      assert_raise Ecto.NoResultsError, fn -> Articles.get_post!(post.id) end
    end

    test "change_post/1 returns a post changeset" do
      post = post_fixture()
      assert %Ecto.Changeset{} = Articles.change_post(post)
    end
  end
end
