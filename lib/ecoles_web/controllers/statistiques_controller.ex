defmodule EcolesWeb.StatistiquesController do
  use EcolesWeb, :controller

  def statistiques(conn, _params) do
    render(conn, "statistiques.html")
  end
end
