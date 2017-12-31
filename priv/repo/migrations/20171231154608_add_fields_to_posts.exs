defmodule Gind.Repo.Migrations.AddFieldsToPosts do
  use Ecto.Migration

  def change do
    alter table(:posts) do
      add :status, :string
    end

  end
end
