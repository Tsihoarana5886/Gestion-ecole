defmodule Ecoles.Repo.Migrations.CreateClasse do
  use Ecto.Migration

  def change do
    create table(:classe) do
      add :nomclasse, :string
      add :place, :integer

      timestamps()
    end
  end
end
