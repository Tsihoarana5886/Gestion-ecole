defmodule Ecoles.Sexemod do
  @moduledoc """
  The Sexemod context.
  """

  import Ecto.Query, warn: false
  alias Ecoles.Repo

  alias Ecoles.Sexemod.Sexe

  @doc """
  Returns the list of sexes.

  ## Examples

      iex> list_sexes()
      [%Sexe{}, ...]

  """
  def list_sexes do
    Repo.all(Sexe)
  end

  @doc """
  Gets a single sexe.

  Raises `Ecto.NoResultsError` if the Sexe does not exist.

  ## Examples

      iex> get_sexe!(123)
      %Sexe{}

      iex> get_sexe!(456)
      ** (Ecto.NoResultsError)

  """
  def get_sexe!(id), do: Repo.get!(Sexe, id)

  @doc """
  Creates a sexe.

  ## Examples

      iex> create_sexe(%{field: value})
      {:ok, %Sexe{}}

      iex> create_sexe(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_sexe(attrs \\ %{}) do
    %Sexe{}
    |> Sexe.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a sexe.

  ## Examples

      iex> update_sexe(sexe, %{field: new_value})
      {:ok, %Sexe{}}

      iex> update_sexe(sexe, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_sexe(%Sexe{} = sexe, attrs) do
    sexe
    |> Sexe.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a sexe.

  ## Examples

      iex> delete_sexe(sexe)
      {:ok, %Sexe{}}

      iex> delete_sexe(sexe)
      {:error, %Ecto.Changeset{}}

  """
  def delete_sexe(%Sexe{} = sexe) do
    Repo.delete(sexe)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking sexe changes.

  ## Examples

      iex> change_sexe(sexe)
      %Ecto.Changeset{data: %Sexe{}}

  """
  def change_sexe(%Sexe{} = sexe, attrs \\ %{}) do
    Sexe.changeset(sexe, attrs)
  end
end
