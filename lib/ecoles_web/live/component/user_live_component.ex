defmodule EcolesWeb.LiveComponent.UserLiveComponent do
  use Phoenix.LiveComponent

  def render(assigns) do
    EcolesWeb.StatistiquesView.render("user_live_component.html", assigns)
  end
end
