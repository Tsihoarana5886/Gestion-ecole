defmodule Ecoles.SexemodFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Ecoles.Sexemod` context.
  """

  @doc """
  Generate a sexe.
  """
  def sexe_fixture(attrs \\ %{}) do
    {:ok, sexe} =
      attrs
      |> Enum.into(%{
        nom: "some nom"
      })
      |> Ecoles.Sexemod.create_sexe()

    sexe
  end
end
