defmodule Ecoles.Shema.Matiere do
  use Ecto.Schema
  import Ecto.Changeset

  alias Ecoles.Shema.Notes

  schema "matieres" do
    field :coef, :integer
    field :nommatiere, :string
    has_many :note, Notes

    timestamps()
  end

  @doc false
  def changeset(matiere, attrs) do
    matiere
    |> cast(attrs, [:nommatiere, :coef])
    |> validate_required([:nommatiere, :coef])
  end
end
