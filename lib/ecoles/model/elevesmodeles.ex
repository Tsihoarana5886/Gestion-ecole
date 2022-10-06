defmodule Ecoles.Model.Elevesmodeles do

  import Ecto.Query, warn: false

  alias Ecoles.Repo
  alias Ecoles.Shema.Eleves

  def change_eleves(%Eleves{} = eleves, attrs \\ %{}) do
    Eleves.changeset(eleves, attrs)
  end

  def create_eleves(attrs \\ %{}) do
    %Eleves{}
    |> Eleves.changeset(attrs)
    |> Repo.insert()
  end

  def getListEleves do
    Repo.all(Eleves)
  end

end
