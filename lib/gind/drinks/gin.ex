defmodule Gind.Drinks.Gin do
  use Ecto.Schema
  import Ecto.Changeset
  alias Gind.Drinks.Gin


  schema "gins" do
    field :brand, :string
    field :name, :string
    field :slug, :string
    field :status, :string
    field :text, :string

    timestamps()
  end

  @doc false
  def changeset(%Gin{} = gin, attrs) do
    gin
    |> cast(attrs, [:name, :brand, :slug, :text, :status])
    |> validate_required([:name, :brand, :slug, :text, :status])
  end
end
