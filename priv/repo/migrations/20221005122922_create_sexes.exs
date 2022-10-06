defmodule Ecoles.Repo.Migrations.CreateSexes do
  use Ecto.Migration

  def change do
    create table(:sexes) do
      add :nom, :string

      timestamps()
    end
  end
end
