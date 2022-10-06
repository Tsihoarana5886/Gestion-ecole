defmodule Ecoles.Repo.Migrations.CreateAdmin do
  use Ecto.Migration

  def change do
    create table(:admin) do
      add :name, :string
      add :lastname, :string
      add :email, :string
      add :mdp, :string

      timestamps()
    end
  end
end
