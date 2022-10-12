defmodule Ecoles.Shema.Notes do
  use Ecto.Schema
  import Ecto.Changeset

  alias Ecoles.Shema.Matiere
  alias Ecoles.Shema.Eleves

  schema "notes" do
    belongs_to :matieres, Matiere
    belongs_to :eleves, Eleves
    field :valeur_notes, :float

    timestamps()
  end

  @doc false
  def changeset(notes, attrs) do
    notes
    |> cast(attrs, [:eleves_id, :matieres_id, :valeur_notes])
    |> validate_required([:eleves_id, :matieres_id, :valeur_notes])
    # |> validate_inclusion(:valeur_notes, 0..20)
  end

end
