defmodule Gind.Repo.Migrations.CreateGins do
  use Ecto.Migration

  def change do
    create table(:gins) do
      add :name, :string
      add :brand, :string
      add :slug, :string
      add :text, :string
      add :status, :string

      timestamps()
    end

  end
end
