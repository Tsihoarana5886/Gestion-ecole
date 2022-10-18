defmodule EcolesWeb.ClassesController do
  use EcolesWeb, :controller

  alias Ecoles.Shema
  alias Ecoles.Shema.Classes
  alias Ecoles.Model.Notesmodeles

  def index(conn, _params) do
    classe = Shema.list_classe()
    render(conn, "index.html", classe: classe)
  end

  def new(conn, _params) do
    changeset = Shema.change_classes(%Classes{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"classes" => classes_params}) do
    case Shema.create_classes(classes_params) do
      {:ok, classes} ->
        conn
        #|> put_flash(:info, "Classes created successfully.")
        |> redirect(to: Routes.classes_path(conn, :show, classes))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    classes = Shema.get_classes!(id)
    render(conn, "show.html", classes: classes)
  end

  def edit(conn, %{"id" => id}) do
    classes = Shema.get_classes!(id)
    changeset = Shema.change_classes(classes)
    render(conn, "edit.html", classes: classes, changeset: changeset)
  end

  def update(conn, %{"id" => id, "classes" => classes_params}) do
    classes = Shema.get_classes!(id)

    case Shema.update_classes(classes, classes_params) do
      {:ok, classes} ->
        conn
        |> put_flash(:info, "Classes updated successfully.")
        |> redirect(to: Routes.classes_path(conn, :show, classes))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", classes: classes, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    classes = Shema.get_classes!(id)
    {:ok, _classes} = Shema.delete_classes(classes)

    conn
    |> put_flash(:info, "Classes deleted successfully.")
    |> redirect(to: Routes.classes_path(conn, :index))
  end

  def goto_page_resultat(conn, _params) do
    # eleves = Elevesmodeles.list_eleves()
    classe = Shema.list_classe()
    render(conn, "voir_resultat.html", classe: classe)
  end

  def result(conn, params) do
    idclasse = get_in(params, ["see", "classe_id"])
    resultat = Notesmodeles.get_result_for_classe(idclasse)
    render(conn, "resultat.html", resultat: resultat)
  end

end
