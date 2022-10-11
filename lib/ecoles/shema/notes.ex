defmodule Ecoles.Shema.Notes do
  use Ecto.Schema
  # import Ecto.Changeset

  alias Ecoles.Shema.Matiere
  alias Ecoles.Shema.Eleves

  schema "notes" do
    belongs_to :matiere, Matiere
    belongs_to :eleves, Eleves
    field :valeur_notes, :float

    timestamps()
  end

end
