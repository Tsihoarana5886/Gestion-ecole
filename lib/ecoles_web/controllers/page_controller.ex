defmodule EcolesWeb.PageController do
  use EcolesWeb, :controller

  alias Ecoles.Model.Adminmodeles
  alias Ecoles.Shema.Admin

  plug :put_layout, "layoutlogin.html"

  # def index(conn, _params) do
  #   render(conn, "index.html")
  # end

  def index(conn, _params) do
    changeset = Adminmodeles.change_admin(%Admin{})
    conn
    |> put_root_layout(false)
    |> render("login.html", changeset: changeset)
  end

  def goTopageLogin(conn, _params) do
    changeset = Adminmodeles.change_admin(%Admin{})
    conn
    |> put_root_layout(false)
    |> render("login.html", changeset: changeset)
  end

end
