defmodule EcolesWeb.Absence.InsertionLive do

  use Phoenix.LiveView

  alias Ecoles.Model.Adminmodeles
  alias EcolesWeb.AbsenceView
  alias Ecoles.Model.Elevesmodeles

  #monter = mount
  def mount(_params, %{"curr_user_id" => user_id}, socket) do
    admin = Adminmodeles.get_admin_id(user_id)
    eleves = Elevesmodeles.getListEleves()
    # {:ok, assign(socket, :admin, admin, :eleves, eleves)}
    {:ok, socket
            |> assign(
                    admin: admin,
                    eleves: eleves
            )
    }
  end

  #generer un evenement = handle_event
  # def handle_event("search-admin", params, socket) do
  #   admin_id = params["admin_search"]
  #   admin = Adminmodeles.get_admin_id(admin_id)

  #   {:noreply, socket |> assign(admin: admin)}
  # end

  #rendre = render
  def render(assigns) do
    AbsenceView.render("insertion.html", assigns)
  end

end
