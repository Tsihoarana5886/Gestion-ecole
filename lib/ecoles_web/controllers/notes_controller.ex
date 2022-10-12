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
    render(conn, "gotopagenotes.html",  changeset: changeset, eleves: eleves, matieres: matieres)
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

end
