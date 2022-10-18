defmodule EcolesWeb.AdminController do
  use EcolesWeb, :controller

  alias Ecoles.Model.Adminmodeles
  alias Ecoles.Shema.Admin

  def goTopageInscription(conn, _params) do
    changeset = Adminmodeles.change_admin(%Admin{})
    conn
    |> put_root_layout(false)
    |> render("inscription.html", changeset: changeset)
    # render(conn, "inscription.html", changeset: changeset)
  end

  def getAdmin(conn, _params) do
    admin = Adminmodeles.get_admin()
    render(conn, "inscription.html", admin: admin)
  end

  def insertAdmin(conn, %{"admin" => admin_params}) do
    case Adminmodeles.create_admin(admin_params) do
      {:ok, admin} ->
        conn
        |> put_flash(:info, "Bienvenue, #{admin.lastname}, vous êtes l'administrateur.")
        |> redirect(to: Routes.page_path(conn, :goTopageLogin))

      {:error, %Ecto.Changeset{} = changeset} ->
        conn
        |> put_root_layout(false)
        |> render("inscription.html", changeset: changeset)
        # render(conn, "inscription.html", changeset: changeset)
    end
  end

  def connecter(conn, %{"admin" => admin_params}) do
    case Adminmodeles.log_admin(admin_params) do
      {:ok, _} ->
        list_admin = Adminmodeles.get_admin()
        identifier = admin_params["email"]
        mdp = admin_params["mdp"]
        us = cond do
          Admin.is_mail?(identifier) -> Enum.find(list_admin, fn %Admin{} = a -> a.email === identifier end )
          Admin.is_passworde?(mdp) -> Enum.find(list_admin, fn %Admin{} = a -> a.mdp === mdp end )
        end

        conn
        # |> put_flash(:info, "Bienvenue, "<>us.lastname<>" !")
        |> put_session(:curr_user_id, us.id)
        |> redirect(to: Routes.admin_path(conn, :accueil))

      {:error, _} ->
        conn
        |> put_flash(:info, "Error d'identifiant")
        |> redirect(to: Routes.page_path(conn, :goTopageLogin))
    end
  end

  def accueil(conn, _params) do
    render(conn, "accueil.html")
  end

  def sign_out(conn, _params) do

    case get_session(conn, :curr_user_id) do
      nil ->
        conn
        |> put_flash(:error, "Vous ne pouvez pas vous déconnecter car vous ne vous êtes pas encore connecté.")
        |> redirect(to: Routes.page_path(conn, :index))

      _ ->
        conn
        |> delete_session(:curr_user_id)
        # |> configure_session(drop: :true)
        #|> put_flash(:info, "Vous vous êtes déconnecté.")
        |> redirect(to: Routes.page_path(conn, :goTopageLogin))
    end

  end

end
