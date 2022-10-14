defmodule Ecoles.Model.Notesmodeles do

  import Ecto.Query, warn: false

  alias Ecoles.Repo
  alias Ecoles.Shema.Eleves
  alias Ecoles.Shema.Classes
  alias Ecoles.Shema.Notes
  alias Ecoles.Shema.Matiere

  def getElevesParClasse(idclasse) do
    query = from e in Eleves,
            join: c in Classes,
            on: c.id == e.classe_id,
            where: e.classe_id == ^idclasse,
            select: %{id: e.id, nom: e.nom, prenom: e.prenom, classe: c.nomclasse}
     Repo.all(query)
  end

  def get_eleves_id(ideleves) do
    query = from e in Eleves,
            join: c in Classes,
            on: c.id == e.classe_id,
            where: e.id == ^ideleves,
            select: %{id: e.id, nom: e.nom, prenom: e.prenom, classe: c.nomclasse}
    Repo.all(query)
  end

  def change_notes(%Notes{} = notes, attrs \\ %{}) do
    Notes.changeset(notes, attrs)
  end

  def create_notes_eleves(attrs \\ %{}) do
    %Notes{}
    |> Notes.changeset(attrs)
    |> Repo.insert()
  end

  def get_notes_eleves(id) do
    query = from n in Notes,
            join: e in Eleves,
            on: e.id == n.eleves_id,
            join: m in Matiere,
            on: m.id == n.matieres_id,
            where: n.id == ^id,
            select: %{notes: n.valeur_notes, ideleves: e.id, nom: e.nom, prenom: e.prenom, matiere: m.nommatiere}
    Repo.all(query)
  end

  # def get_all_notes do
  #   Repo.all(Notes)
  # end

  def get_all_notes do
    query = from n in Notes,
            join: e in Eleves,
            on: e.id == n.eleves_id,
            join: m in Matiere,
            on: m.id == n.matieres_id,
            select: %{valeur_notes: n.valeur_notes, eleves_id: n.eleves_id, matieres_id: n.matieres_id, matiere: m.nommatiere}
    Repo.all(query)
  end

  def show_notes_study(id) do
    query = from n in Notes,
            join: e in Eleves,
            on: e.id == n.eleves_id,
            join: m in Matiere,
            on: m.id == n.matieres_id,
            where: e.id == ^id,
            select: %{note: n.valeur_notes, ideleves: e.id, nom: e.nom, prenom: e.prenom, age: e.age, matiere: m.nommatiere, coefficient: m.coef}
    Repo.all(query)
  end

  def sum_notes_to_coef(id) do
    query = from n in Notes,
            join: e in Eleves,
            on: e.id == n.eleves_id,
            join: m in Matiere,
            on: m.id == n.matieres_id,
            where: e.id == ^id,
            select: %{sommenotescoef: sum(n.valeur_notes * m.coef)}
    Repo.all(query)
  end

  def sum_coef do
    query = from m in Matiere,
            select: %{sumcoef: sum(m.coef * 20)}
    Repo.all(query)
  end

  def calcul_moyenne(id) do
    query = from n in Notes,
            join: e in Eleves,
            on: e.id == n.eleves_id,
            join: m in Matiere,
            on: m.id == n.matieres_id,
            where: e.id == ^id,
            select: %{moyenne: ((sum(n.valeur_notes * m.coef) / 19))}
    Repo.all(query)
  end

  def rang_to_moyenne(idclasse) do
    query = from n in Notes,
            join: e in Eleves,
            on: e.id == n.eleves_id,
            join: m in Matiere,
            on: m.id == n.matieres_id,
            where: e.classe_id == ^idclasse,
            group_by: e.nom,
            select: %{rang: row_number() |> over(order_by: [desc: (sum(n.valeur_notes * m.coef)/ 19)]), nom: e.nom}
    Repo.all(query)
  end

end
