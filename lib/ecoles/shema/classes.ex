defmodule Ecoles.Shema.Classes do
  use Ecto.Schema
  import Ecto.Changeset

  schema "classe" do
    field :nomclasse, :string
    field :place, :integer

    timestamps()
  end

  @doc false
  def changeset(classes, attrs) do
    classes
    |> cast(attrs, [:nomclasse, :place])
    |> validate_required([:nomclasse, :place])
  end
end
