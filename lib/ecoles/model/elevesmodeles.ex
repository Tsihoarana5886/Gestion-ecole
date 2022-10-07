defmodule Ecoles.Model.Elevesmodeles do

  import Ecto.Query, warn: false

  alias Ecoles.Repo
  alias Ecoles.Shema.Eleves
  alias Ecoles.Sexemod.Sexe
  alias Ecoles.Shema.Classes

  def change_eleves(%Eleves{} = eleves, attrs \\ %{}) do
    Eleves.changeset(eleves, attrs)
  end

  def create_eleves(attrs \\ %{}) do
    %Eleves{}
    |> Eleves.changeset(attrs)
    |> Repo.insert()
  end

  # def getListEleves do
  #   Repo.all(Eleves)
  # end

  def getListEleves do
    query = from e in Eleves,
          join: c in Classes, on: c.id == e.classe_id,
          select: e
    Repo.all(query)
  end

end
