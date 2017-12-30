defmodule Gind.Repo.Migrations.CreateBars do
  use Ecto.Migration

  def change do
    create table(:bars) do
      add :name, :string
      add :text, :string
      add :address, :string
      add :phone, :integer
      add :website, :string
      add :country, :string

      timestamps()
    end

  end
end
