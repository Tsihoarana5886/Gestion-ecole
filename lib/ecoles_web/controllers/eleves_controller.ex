defmodule EcolesWeb.ElevesController do
  use EcolesWeb, :controller

  alias Ecoles.Model.Elevesmodeles
  alias Ecoles.Shema.Eleves
  alias Ecoles.Sexemod
  alias Ecoles.Shema
  # alias Ecoles.Repo


  def gotoPageInsertEleves(conn, _params) do
    changeset = Elevesmodeles.change_eleves(%Eleves{})
    sexe = Sexemod.list_sexes()
    classe = Shema.list_classe()
    render(conn, "inscription.html", changeset: changeset, sexe: sexe, classe: classe)
  end

  def createELeves(conn, %{"eleves" => eleves_params}) do
    case Elevesmodeles.create_eleves(eleves_params) do
      {:ok, eleves} ->
        conn
        |> put_flash(:info, "Eleves created successfully.")
        #|> redirect(to: Routes.users_path(conn, :getAllUsers, users))
        |> redirect(to: Routes.eleves_path(conn, :getListEleves, eleves))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "inscription.html", changeset: changeset)
    end
  end

  def getListEleves(conn, _params) do
    eleves = Elevesmodeles.getListEleves()
    sexe = Sexemod.list_sexes()
    classe = Shema.list_classe()
    render(conn, "liste_eleves.html", eleves: eleves, sexe: sexe, classe: classe)
  end

  def getFilter(conn, params) do
    idSexe = get_in(params,["search", "sexes_id"])
    eleves = Elevesmodeles.getfilter(idSexe)
    render(conn, "repFiltre.html", eleves: eleves)
  end

end
