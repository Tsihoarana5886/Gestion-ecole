defmodule Ecoles.Shema.Admin do

  use Ecto.Schema
  import Ecto.Changeset
  alias Ecoles.Model.Adminmodeles
  alias Ecoles.Shema.Admin

  schema "admin" do
    field :name, :string
    field :lastname, :string
    field :email, :string
    field :mdp, :string

    timestamps()
  end

  @doc false
  def changeset(admin, attrs) do
    admin
    |> cast(attrs, [:name, :lastname, :email, :mdp])
    |> validate_required([:name, :lastname, :email, :mdp])
    |> validate_format(:email, ~r/@/)
    |> validate_length(:mdp, min: 6)
    |> unique_constraint(:lastname)
    |> unique_constraint(:email)
  end

  def authenticate(admin, attrs) do
    admin
    |> cast(attrs, [:email, :mdp])
    |> validate_required(:email, message: "Votre email ne doit pas être vide")
    |> validate_required(:mdp, message: "Mot de passe ne peut pas être vide")
    |> check_if_admin
    |> check_if_mot_de_passe
    |> apply_action(:login)
  end

  def is_mail?(string) do
    listadmin = Adminmodeles.get_admin()
    email = Enum.map(listadmin, fn %Admin{} = admin -> admin.email end)
    Enum.member?(email, string)
  end

  def is_passworde?(string) do
    listadmin = Adminmodeles.get_admin()
    mdp = Enum.map(listadmin, fn %Admin{} = admin -> admin.mdp end)
    Enum.member?(mdp, string)
  end

  defp check_if_admin(changeset) do
    email = get_field(changeset, :email)
    listadmin = Adminmodeles.get_admin()
    emails = Enum.map(listadmin, fn %Admin{} = admin -> admin.email end)
    cond do
      Enum.member?(emails, email) -> changeset
      true -> add_error(changeset, :not_user, "Identifiant inexistant")
    end
  end

  defp check_if_mot_de_passe(changeset) do
    mdp = get_field(changeset, :mdp)
    listadmin = Adminmodeles.get_admin()
    motdepasse = Enum.map(listadmin, fn %Admin{} = admin -> admin.mdp end)
    cond do
      Enum.member?(motdepasse, mdp) -> changeset
      true -> add_error(changeset, :not_user, "Mot de passe incorrect")
    end
  end

end
