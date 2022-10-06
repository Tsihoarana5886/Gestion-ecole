defmodule Ecoles.Login do
  use EcolesWeb, :controller

  alias Ecoles.Shema.Admin

  def log_admin(attrs \\ %{}) do
    %Admin{}
    |> Admin.authenticate(attrs)
  end

end
