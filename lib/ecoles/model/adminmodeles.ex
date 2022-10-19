defmodule Ecoles.Model.Adminmodeles do

  import Ecto.Query, warn: false

  alias Ecoles.Repo
  alias Ecoles.Shema.Admin

  def change_admin(%Admin{} = admin, attrs \\ %{}) do
    Admin.changeset(admin, attrs)
  end

  def create_admin(attrs \\ %{}) do
    %Admin{}
    |> Admin.changeset(attrs)
    |> Repo.insert()
  end

  def get_admin do
    Repo.all(Admin)
  end

  def login(email, mdp) do
    query = from a in Admin,
          where: a.email == ^email and a.mdp == ^mdp,
          select: a
    Repo.all(query)
  end

  def log_admin(attrs \\ %{}) do
    %Admin{}
    |> Admin.authenticate(attrs)
  end

  def get_admin_id(id) do
    query = from a in Admin,
            where: a.id == ^id,
            select: %{id: a.id, email: a.email, mdp: a.mdp}
    Repo.all(query)
  end

end
