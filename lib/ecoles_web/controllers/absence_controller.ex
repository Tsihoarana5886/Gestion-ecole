defmodule EcolesWeb.AbsenceController do
  use EcolesWeb, :controller
  alias Phoenix.LiveView

  def goto_form_absence(conn, _params) do
    LiveView.Controller.live_render(conn, EcolesWeb.Absence.InsertionLive, session: %{"curr_user_id" => get_session(conn, :curr_user_id)}, router: EcolesWeb.Router)
  end

  def list_absence(conn, _params) do
    LiveView.Controller.live_render(conn, EcolesWeb.Absence.ListeLive, session: %{"curr_user_id" => get_session(conn, :curr_user_id)}, router: EcolesWeb.Router)
  end
end
