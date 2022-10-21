defmodule Ecoles.Shema.Absence do
  use Ecto.Schema
  import Ecto.Changeset

  alias Ecoles.Shema.Eleves

  schema "absence" do
    field :date_debut, :date
    field :date_fin, :date
    field :motifs, :string
    belongs_to :eleves, Eleves

    timestamps()
  end

  @doc false
  def changeset(absence, attrs) do
    absence
    |> cast(attrs, [:motifs, :date_debut, :date_fin, :eleves_id])
    |> validate_required([:motifs, :date_debut, :date_fin, :eleves_id])
  end
end
