defmodule Ecoles.ShemaFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Ecoles.Shema` context.
  """

  @doc """
  Generate a classes.
  """
  # def classes_fixture(attrs \\ %{}) do
  #   {:ok, classes} =
  #     attrs
  #     |> Enum.into(%{

  #     })
  #     |> Ecoles.Shema.create_classes()

  #   classes
  # end

  @doc """
  Generate a classes.
  """
  def classes_fixture(attrs \\ %{}) do
    {:ok, classes} =
      attrs
      |> Enum.into(%{
        nomclasse: "some nomclasse",
        place: 42
      })
      |> Ecoles.Shema.create_classes()

    classes
  end

  @doc """
  Generate a matiere.
  """
  def matiere_fixture(attrs \\ %{}) do
    {:ok, matiere} =
      attrs
      |> Enum.into(%{
        coef: 42,
        nommatiere: "some nommatiere"
      })
      |> Ecoles.Shema.create_matiere()

    matiere
  end
end
