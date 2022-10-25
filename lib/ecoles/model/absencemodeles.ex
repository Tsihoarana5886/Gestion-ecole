defmodule Ecoles.Model.Absencemodeles do

  import Ecto.Query, warn: false

  alias Ecoles.Repo
  alias Ecoles.Shema.Absence
  alias Ecoles.Shema.Classes
  alias Ecoles.Shema.Eleves

  def list_absence do
    query = from a in Absence,
            join: e in Eleves,
            on: e.id == a.eleves_id,
            join: c in Classes,
            on: c.id == e.classe_id,
            select: %{id: a.id, motifs: a.motifs, date_debut: a.date_debut, date_fin: a.date_fin, ideleves: a.eleves_id, nom: e.nom, prenom: e.prenom, classe: c.nomclasse}
    Repo.all(query)
  end
end
