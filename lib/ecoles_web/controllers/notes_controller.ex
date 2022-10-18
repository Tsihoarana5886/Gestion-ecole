defmodule EcolesWeb.NotesController do
  use EcolesWeb, :controller

  alias Ecoles.Shema
  alias Ecoles.Model.Elevesmodeles
  alias Ecoles.Model.Notesmodeles
  alias Ecoles.Shema.Notes


  def gotoPageSaisieNotes(conn, _params) do
    eleves = Elevesmodeles.list_eleves()
    classe = Shema.list_classe()
    render(conn, "saisie_note.html", eleves: eleves ,classe: classe)
  end

  def get_list_eleves_classe(conn, params) do
    idclasse = get_in(params, ["search", "classe_id"])
    eleves = Notesmodeles.getElevesParClasse(idclasse)
    matieres = Shema.list_matieres()
    changeset = Notesmodeles.change_notes(%Notes{})
    notes = Notesmodeles.get_all_notes()
    study = Elevesmodeles.list_eleves()
    render(conn, "gotopagenotes.html",  changeset: changeset, eleves: eleves, matieres: matieres, notes: notes, study: study)
  end

  def saisirNotes(conn, %{"notes" => notes_params}) do
    case Notesmodeles.create_notes_eleves(notes_params) do
      {:ok, notes} ->
        conn
        |> put_flash(:info, "Note enregistrer")
        |> redirect(to: Routes.notes_path(conn, :getNotesById, notes))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "liste_eleves_notes.html", changeset: changeset)
    end
  end

  def getNotesById(conn, %{"id" => id}) do
    notes = Notesmodeles.get_notes_eleves(id)
    render(conn, "show.html", notes: notes)
  end

  def getFilter(conn, params) do
    idSexe = get_in(params,["search", "sexes_id"])
    idClasse = get_in(params,["search", "classe_id"])
    eleves = Elevesmodeles.getfilter(idSexe, idClasse)
    render(conn, "repFiltre.html", eleves: eleves)
  end

  def getfilterstudy(conn, params) do
    ideleves = get_in(params, ["filter", "id"])
    eleves = Notesmodeles.get_eleves_id(ideleves)
    matieres = Shema.list_matieres()
    changeset = Notesmodeles.change_notes(%Notes{})
    notes = Notesmodeles.get_all_notes()
    study = Elevesmodeles.list_eleves()
    render(conn, "gotopagenotes.html",  changeset: changeset, eleves: eleves, matieres: matieres, notes: notes, study: study)
  end

  def show_notes_study(conn, params) do
    ideleves = get_in(params, ["show", "id"])
    idclasse = get_in(params, ["show", "idclasse"])
    eleves = Notesmodeles.show_notes_study(ideleves)
    study = Elevesmodeles.get_eleves(ideleves)
    # sommenotes = Enum.sum([eleves.notes * eleves.coefficient])
    sommenotes = Notesmodeles.sum_notes_to_coef(ideleves)
    sumcoef = Notesmodeles.sum_coef()
    moyenne = Notesmodeles.calcul_moyenne(ideleves)
    # average = %{moyenne: moyenne}
    rang = Notesmodeles.rang_to_moyenne(idclasse)
    render(conn, "bulletin.html", eleves: eleves, study: study, sommenotes: sommenotes, sumcoef: sumcoef, moyenne: moyenne, rang: rang)
  end

end
