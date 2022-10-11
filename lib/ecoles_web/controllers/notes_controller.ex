defmodule EcolesWeb.NotesController do
  use EcolesWeb, :controller

  alias Ecoles.Shema
  alias Ecoles.Model.Elevesmodeles


  def gotoPageSaisieNotes(conn, _params) do
    eleves = Elevesmodeles.list_eleves()
    matieres = Shema.list_matieres()
    render(conn, "saisie_note.html", eleves: eleves, matieres: matieres)
  end

end
