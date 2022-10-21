defmodule Ecoles.Repo.Migrations.CreateAbsence do
  use Ecto.Migration

  def change do
    create table(:absence) do
      add :motifs, :text
      add :date_debut, :date
      add :date_fin, :date
      add :eleves_id, references(:eleves)

      timestamps()
    end

    # create index(:absence, [:eleves_id])
  end
end
