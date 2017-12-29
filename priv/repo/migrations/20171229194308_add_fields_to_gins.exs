defmodule Gind.Repo.Migrations.AddFieldsToGins do
  use Ecto.Migration

  def change do
    alter table(:gins) do
      add :abv, :string
      add :price_range, :string
      add :distillery, :string
      add :garnish, :string
    end
  end

end
