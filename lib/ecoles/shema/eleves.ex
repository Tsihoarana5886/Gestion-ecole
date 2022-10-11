defmodule Ecoles.Shema.Eleves do

  use Ecto.Schema
  import Ecto.Changeset

  alias Ecoles.Shema.Notes

  schema "eleves" do
    field :nom, :string
    field :prenom, :string
    field :age, :integer
    field :sexes_id, :integer
    field :classe_id, :integer
    has_many :note, Notes

    timestamps()
  end

  @doc false
  def changeset(eleves, attrs) do
    eleves
    |> cast(attrs, [:nom, :prenom, :age, :sexes_id, :classe_id])
    |> validate_required([:nom, :prenom, :age, :sexes_id, :classe_id])
    |> validate_inclusion(:age, 10..20)
    |> unique_constraint(:sexes_id, message: "Error sur l'insertion sexe")
    |> unique_constraint(:classe_id, message: "Error sur l'insertion classe")
  end

end
