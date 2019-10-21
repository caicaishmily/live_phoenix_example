defmodule LivePhoenixExample.Repo.Migrations.AddGirlsTable do
  use Ecto.Migration

  def change do
    create table(:girls) do
      add :name, :string, null: false
      add :avatar, :string, null: false
      add :age,     :integer, null: false
      add :like,      :integer, null: false
      add :dislike,   :integer, null: false

      timestamps()
    end
  end
end
