defmodule Ecoles.Sexemod.Sexe do
  use Ecto.Schema
  import Ecto.Changeset


  schema "sexes" do
    field :nom, :string

    timestamps()
  end

  @doc false
  def changeset(sexe, attrs) do
    sexe
    |> cast(attrs, [:nom])
    |> validate_required([:nom])
  end

end
