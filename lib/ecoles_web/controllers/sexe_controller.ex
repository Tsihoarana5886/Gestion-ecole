defmodule EcolesWeb.SexeController do
  use EcolesWeb, :controller

  alias Ecoles.Sexemod
  alias Ecoles.Sexemod.Sexe

  def index(conn, _params) do
    sexes = Sexemod.list_sexes()
    render(conn, "index.html", sexes: sexes)
  end

  def new(conn, _params) do
    changeset = Sexemod.change_sexe(%Sexe{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"sexe" => sexe_params}) do
    case Sexemod.create_sexe(sexe_params) do
      {:ok, sexe} ->
        conn
        #|> put_flash(:info, "Sexe created successfully.")
        |> redirect(to: Routes.sexe_path(conn, :show, sexe))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    sexe = Sexemod.get_sexe!(id)
    render(conn, "show.html", sexe: sexe)
  end

  def edit(conn, %{"id" => id}) do
    sexe = Sexemod.get_sexe!(id)
    changeset = Sexemod.change_sexe(sexe)
    render(conn, "edit.html", sexe: sexe, changeset: changeset)
  end

  def update(conn, %{"id" => id, "sexe" => sexe_params}) do
    sexe = Sexemod.get_sexe!(id)

    case Sexemod.update_sexe(sexe, sexe_params) do
      {:ok, sexe} ->
        conn
        #|> put_flash(:info, "Sexe updated successfully.")
        |> redirect(to: Routes.sexe_path(conn, :show, sexe))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", sexe: sexe, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    sexe = Sexemod.get_sexe!(id)
    {:ok, _sexe} = Sexemod.delete_sexe(sexe)

    conn
    #|> put_flash(:info, "Sexe deleted successfully.")
    |> redirect(to: Routes.sexe_path(conn, :index))
  end
end
