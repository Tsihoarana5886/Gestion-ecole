defmodule Ecoles.Repo.Migrations.CreateNotes do
  use Ecto.Migration

  def change do
    create table(:notes) do
      add :eleves_id, references(:eleves)
      add :matieres_id, references(:matieres)
      add :valeur_notes, :float

      timestamps()
    end

  end

end
