defmodule Ecoles.SexemodTest do
  use Ecoles.DataCase

  alias Ecoles.Sexemod

  describe "sexes" do
    alias Ecoles.Sexemod.Sexe

    import Ecoles.SexemodFixtures

    @invalid_attrs %{nom: nil}

    test "list_sexes/0 returns all sexes" do
      sexe = sexe_fixture()
      assert Sexemod.list_sexes() == [sexe]
    end

    test "get_sexe!/1 returns the sexe with given id" do
      sexe = sexe_fixture()
      assert Sexemod.get_sexe!(sexe.id) == sexe
    end

    test "create_sexe/1 with valid data creates a sexe" do
      valid_attrs = %{nom: "some nom"}

      assert {:ok, %Sexe{} = sexe} = Sexemod.create_sexe(valid_attrs)
      assert sexe.nom == "some nom"
    end

    test "create_sexe/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Sexemod.create_sexe(@invalid_attrs)
    end

    test "update_sexe/2 with valid data updates the sexe" do
      sexe = sexe_fixture()
      update_attrs = %{nom: "some updated nom"}

      assert {:ok, %Sexe{} = sexe} = Sexemod.update_sexe(sexe, update_attrs)
      assert sexe.nom == "some updated nom"
    end

    test "update_sexe/2 with invalid data returns error changeset" do
      sexe = sexe_fixture()
      assert {:error, %Ecto.Changeset{}} = Sexemod.update_sexe(sexe, @invalid_attrs)
      assert sexe == Sexemod.get_sexe!(sexe.id)
    end

    test "delete_sexe/1 deletes the sexe" do
      sexe = sexe_fixture()
      assert {:ok, %Sexe{}} = Sexemod.delete_sexe(sexe)
      assert_raise Ecto.NoResultsError, fn -> Sexemod.get_sexe!(sexe.id) end
    end

    test "change_sexe/1 returns a sexe changeset" do
      sexe = sexe_fixture()
      assert %Ecto.Changeset{} = Sexemod.change_sexe(sexe)
    end
  end
end
