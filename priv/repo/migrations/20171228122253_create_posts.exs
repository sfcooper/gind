defmodule Gind.Repo.Migrations.CreatePosts do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add :title, :string
      add :snippet, :string
      add :text, :string
      add :slug, :string

      timestamps()
    end

  end
end
