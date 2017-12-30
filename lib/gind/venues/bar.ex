defmodule Gind.Venues.Bar do
  use Ecto.Schema
  import Ecto.Changeset
  alias Gind.Venues.Bar


  schema "bars" do
    field :address, :string
    field :country, :string
    field :name, :string
    field :phone, :integer
    field :website, :string

    timestamps()
  end

  @doc false
  def changeset(%Bar{} = bar, attrs) do
    bar
    |> cast(attrs, [:name, :address, :phone, :website, :country, :country])
    |> validate_required([:name, :address, :phone, :website, :country, :country])
  end
end
