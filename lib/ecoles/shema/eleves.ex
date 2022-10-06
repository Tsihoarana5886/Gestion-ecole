defmodule Ecoles.Shema.Eleves do

  use Ecto.Schema
  import Ecto.Changeset

  schema "eleves" do
    field :nom, :string
    field :prenom, :string
    field :age, :integer
    field :sexes_id, :integer
    field :classe_id, :integer

    timestamps()
  end

  @doc false
  def changeset(eleves, attrs) do
    eleves
    |> cast(attrs, [:nom, :prenom, :age, :sexes_id, :classe_id])
    |> validate_required([:nom, :prenom, :age, :sexes_id, :classe_id])
  end

end
