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

  def list_eleves do
    Repo.all(Eleves)
  end

  def getListEleves do
    query = from e in Eleves,
            join: s in Sexe,
            on: s.id == e.sexes_id,
            join: c in Classes,
            on: c.id == e.classe_id,
            select: %{id: e.id, nom: e.nom, prenom: e.prenom, age: e.age, sexe: s.nom, classe: c.nomclasse}
    Repo.all(query)
  end

  def getfilter(idSexe, idClasse) do
    query = from e in Eleves,
            join: s in Sexe,
            on: s.id == e.sexes_id,
            join: c in Classes,
            on: c.id == e.classe_id,
            where: e.sexes_id == ^idSexe and e.classe_id == ^idClasse,
            select: %{nom: e.nom, prenom: e.prenom, age: e.age, sexe: s.nom, classe: c.nomclasse}
    Repo.all(query)
  end

  # def get_eleves!(id), do: Repo.get!(Eleves, id)

  def get_eleves(id) do
    query = from e in Eleves,
            join: s in Sexe,
            on: s.id == e.sexes_id,
            join: c in Classes,
            on: c.id == e.classe_id,
            where: e.id == ^id,
            select: %{nom: e.nom, prenom: e.prenom, age: e.age, sexe: s.nom, classe: c.nomclasse}
    Repo.all(query)
  end

end
