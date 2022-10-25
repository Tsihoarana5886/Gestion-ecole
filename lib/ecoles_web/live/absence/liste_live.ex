defmodule EcolesWeb.Absence.ListeLive do

  use Phoenix.LiveView
  alias Ecoles.Model.Absencemodeles
  alias EcolesWeb.AbsenceView

  #monter = mount
  def mount(_params, _session, socket) do
    absence = Absencemodeles.list_absence()
    {:ok, assign(socket, :absence, absence)}
  end


  #rendre = render
  def render(assigns) do
    AbsenceView.render("liste.html", assigns)
  end

end
