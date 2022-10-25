defmodule EcolesWeb.Absence.InsertionLive do

  use Phoenix.LiveView

  # alias Ecoles.Model.Adminmodeles
  alias EcolesWeb.AbsenceView
  alias Ecoles.Model.Elevesmodeles
  alias Ecoles.Shema
  alias Ecoles.Shema.Absence

  #monter = mount
  # def mount(_params, %{"curr_user_id" => user_id}, socket) do
  #   admin = Adminmodeles.get_admin_id(user_id)
  #   # eleves = Elevesmodeles.getListEleves()
  #   # {:ok, assign(socket, :admin, admin, :eleves, eleves)}
  #   {:ok, socket
  #           |> assign(
  #                   admin: admin,
  #                   # eleves: eleves
  #           ),
  #           %{changeset: Shema.change_absence(%Absence{})}
  #   }
  # end

  # #generer un evenement = handle_event
  # def handle_event("add-absence", %{"absence" => absence_params}, socket) do
  #   # admin_id = params["admin_search"]
  #   # admin = Adminmodeles.get_admin_id(admin_id)

  #   # {:noreply, socket |> assign(admin: admin)}

  #   # motifs = params["motifs"]
  #   # eleves_id = params["eleves_id"]
  #   # date_debut = params["date_debut"]
  #   # date_fin = params["date_fin"]

  #   # absence_params = %{"motifs" => motifs, "date_debut" => date_debut, "date_fin" => date_fin, "eleve_id" => eleves_id}
  #   case Shema.create_absence(absence_params) do
  #     {:ok, _} ->
  #       absence = Shema.list_absence()
  #       {:noreply, socket |> assign(absence: absence)}

  #     {:error, _} ->
  #       absence = Shema.list_absence()
  #       {:noreply, socket |> assign(absence: absence)}

  #   end

  # end

  def mount(_params, _session, socket) do
    eleves = Elevesmodeles.getListEleves()
    {:ok, socket
                |> assign(
                  eleves: eleves,
                  changeset: Shema.change_absence(%Absence{})
                )
    }
  end

  def handle_event("add-absence", %{"absence" => params}, socket) do
    changeset =
      %Absence{}
      |> Shema.change_absence(params)
      |> Map.put(:action, :insert)

    {:noreply, assign(socket, changeset: changeset)}
  end

  def handle_event("save", %{"absence" => absence_params}, socket) do
    case Shema.create_absence(absence_params) do
      {:ok, _} ->
        {:noreply,
        socket
          |> put_flash(:info, "Absence inserer")}
        # |> redirect(to: Routes.user_path(MyAppWeb.Endpoint, MyAppWeb.User.ShowView, user))}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end

  def render(assigns) do
    AbsenceView.render("insertion.html", assigns)
  end


end
