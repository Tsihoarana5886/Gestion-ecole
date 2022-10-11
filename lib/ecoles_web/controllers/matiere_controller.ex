defmodule EcolesWeb.MatiereController do
  use EcolesWeb, :controller

  alias Ecoles.Shema
  alias Ecoles.Shema.Matiere

  def index(conn, _params) do
    matieres = Shema.list_matieres()
    render(conn, "index.html", matieres: matieres)
  end

  def new(conn, _params) do
    changeset = Shema.change_matiere(%Matiere{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"matiere" => matiere_params}) do
    case Shema.create_matiere(matiere_params) do
      {:ok, matiere} ->
        conn
        |> put_flash(:info, "Matiere created successfully.")
        |> redirect(to: Routes.matiere_path(conn, :show, matiere))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    matiere = Shema.get_matiere!(id)
    render(conn, "show.html", matiere: matiere)
  end

  def edit(conn, %{"id" => id}) do
    matiere = Shema.get_matiere!(id)
    changeset = Shema.change_matiere(matiere)
    render(conn, "edit.html", matiere: matiere, changeset: changeset)
  end

  def update(conn, %{"id" => id, "matiere" => matiere_params}) do
    matiere = Shema.get_matiere!(id)

    case Shema.update_matiere(matiere, matiere_params) do
      {:ok, matiere} ->
        conn
        |> put_flash(:info, "Matiere updated successfully.")
        |> redirect(to: Routes.matiere_path(conn, :show, matiere))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", matiere: matiere, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    matiere = Shema.get_matiere!(id)
    {:ok, _matiere} = Shema.delete_matiere(matiere)

    conn
    |> put_flash(:info, "Matiere deleted successfully.")
    |> redirect(to: Routes.matiere_path(conn, :index))
  end
end
