defmodule Ecoles.Shema do
  @moduledoc """
  The Shema context.
  """

  import Ecto.Query, warn: false
  alias Ecoles.Repo

  alias Ecoles.Shema.Classes

  @doc """
  Returns the list of classe.

  ## Examples

      iex> list_classe()
      [%Classes{}, ...]

  """
  def list_classe do
    Repo.all(Classes)
  end

  @doc """
  Gets a single classes.

  Raises `Ecto.NoResultsError` if the Classes does not exist.

  ## Examples

      iex> get_classes!(123)
      %Classes{}

      iex> get_classes!(456)
      ** (Ecto.NoResultsError)

  """
  def get_classes!(id), do: Repo.get!(Classes, id)

  @doc """
  Creates a classes.

  ## Examples

      iex> create_classes(%{field: value})
      {:ok, %Classes{}}

      iex> create_classes(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_classes(attrs \\ %{}) do
    %Classes{}
    |> Classes.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a classes.

  ## Examples

      iex> update_classes(classes, %{field: new_value})
      {:ok, %Classes{}}

      iex> update_classes(classes, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_classes(%Classes{} = classes, attrs) do
    classes
    |> Classes.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a classes.

  ## Examples

      iex> delete_classes(classes)
      {:ok, %Classes{}}

      iex> delete_classes(classes)
      {:error, %Ecto.Changeset{}}

  """
  def delete_classes(%Classes{} = classes) do
    Repo.delete(classes)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking classes changes.

  ## Examples

      iex> change_classes(classes)
      %Ecto.Changeset{data: %Classes{}}

  """
  def change_classes(%Classes{} = classes, attrs \\ %{}) do
    Classes.changeset(classes, attrs)
  end

  alias Ecoles.Shema.Matiere

  @doc """
  Returns the list of matieres.

  ## Examples

      iex> list_matieres()
      [%Matiere{}, ...]

  """
  def list_matieres do
    Repo.all(Matiere)
  end

  @doc """
  Gets a single matiere.

  Raises `Ecto.NoResultsError` if the Matiere does not exist.

  ## Examples

      iex> get_matiere!(123)
      %Matiere{}

      iex> get_matiere!(456)
      ** (Ecto.NoResultsError)

  """
  def get_matiere!(id), do: Repo.get!(Matiere, id)

  @doc """
  Creates a matiere.

  ## Examples

      iex> create_matiere(%{field: value})
      {:ok, %Matiere{}}

      iex> create_matiere(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_matiere(attrs \\ %{}) do
    %Matiere{}
    |> Matiere.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a matiere.

  ## Examples

      iex> update_matiere(matiere, %{field: new_value})
      {:ok, %Matiere{}}

      iex> update_matiere(matiere, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_matiere(%Matiere{} = matiere, attrs) do
    matiere
    |> Matiere.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a matiere.

  ## Examples

      iex> delete_matiere(matiere)
      {:ok, %Matiere{}}

      iex> delete_matiere(matiere)
      {:error, %Ecto.Changeset{}}

  """
  def delete_matiere(%Matiere{} = matiere) do
    Repo.delete(matiere)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking matiere changes.

  ## Examples

      iex> change_matiere(matiere)
      %Ecto.Changeset{data: %Matiere{}}

  """
  def change_matiere(%Matiere{} = matiere, attrs \\ %{}) do
    Matiere.changeset(matiere, attrs)
  end
end
