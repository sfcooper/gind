defmodule Gind.Articles.Post do
  use Ecto.Schema
  import Ecto.Changeset
  alias Gind.Articles.Post


  schema "posts" do
    field :slug, :string
    field :snippet, :string
    field :text, :string
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(%Post{} = post, attrs) do
    attrs = Map.merge(attrs, slug_map(attrs))

    post
    |> cast(attrs, [:title, :snippet, :text, :slug])
    |> validate_required([:title, :snippet, :text, :slug])
  end

  defimpl Phoenix.Param, for: Post do
    def to_param(%{slug: slug}) do
      "#{slug}"
    end
  end

    defp slug_map(%{"title" => title}) do
      slug = String.downcase(title) |> String.replace(" ", "-")
      %{"slug" => slug}
    end

  defp slug_map(_params) do
  %{}
  end
end
