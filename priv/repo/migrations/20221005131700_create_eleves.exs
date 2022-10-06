defmodule Ecoles.Repo.Migrations.CreateEleves do
  use Ecto.Migration

  def change do
    create table(:eleves) do
      add :nom, :string
      add :prenom, :string
      add :age, :integer
      add :sexes_id, references(:sexes, on_delete: :delete_all)
      add :classe_id, references(:classe, on_delete: :delete_all)

      timestamps()
    end
    create unique_index(:eleves, [:sexes_id, :classe_id])
  end
end
