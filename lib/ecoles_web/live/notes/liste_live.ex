defmodule EcolesWeb.Notes.ListeLive do

  use Phoenix.LiveView
  # alias Ecoles.Model.Notesmodeles
  alias Ecoles.Model.Adminmodeles
  alias EcolesWeb.NotesView

  #monter = mount
  def mount(_params, %{"curr_user_id" => user_id}, socket) do
    admin = Adminmodeles.get_admin_id(user_id)
    {:ok, assign(socket, :admin, admin)}
  end

  #generer un evenement = handle_event
  def handle_event("search-admin", params, socket) do
    admin_id = params["admin_search"]
    admin = Adminmodeles.get_admin_id(admin_id)

    {:noreply, socket |> assign(admin: admin)}
  end

  #rendre = render
  def render(assigns) do
    NotesView.render("liste.html", assigns)
  end

end
