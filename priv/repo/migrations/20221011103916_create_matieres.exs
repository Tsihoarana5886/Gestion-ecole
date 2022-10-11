defmodule Ecoles.Repo.Migrations.CreateMatieres do
  use Ecto.Migration

  def change do
    create table(:matieres) do
      add :nommatiere, :string
      add :coef, :integer

      timestamps()
    end
  end
end
