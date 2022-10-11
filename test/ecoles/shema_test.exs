defmodule Ecoles.ShemaTest do
  use Ecoles.DataCase

  alias Ecoles.Shema

  describe "classe" do
    alias Ecoles.Shema.Classes

    import Ecoles.ShemaFixtures

    @invalid_attrs %{}

    test "list_classe/0 returns all classe" do
      classes = classes_fixture()
      assert Shema.list_classe() == [classes]
    end

    test "get_classes!/1 returns the classes with given id" do
      classes = classes_fixture()
      assert Shema.get_classes!(classes.id) == classes
    end

    test "create_classes/1 with valid data creates a classes" do
      valid_attrs = %{}

      assert {:ok, %Classes{} = classes} = Shema.create_classes(valid_attrs)
    end

    test "create_classes/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Shema.create_classes(@invalid_attrs)
    end

    test "update_classes/2 with valid data updates the classes" do
      classes = classes_fixture()
      update_attrs = %{}

      assert {:ok, %Classes{} = classes} = Shema.update_classes(classes, update_attrs)
    end

    test "update_classes/2 with invalid data returns error changeset" do
      classes = classes_fixture()
      assert {:error, %Ecto.Changeset{}} = Shema.update_classes(classes, @invalid_attrs)
      assert classes == Shema.get_classes!(classes.id)
    end

    test "delete_classes/1 deletes the classes" do
      classes = classes_fixture()
      assert {:ok, %Classes{}} = Shema.delete_classes(classes)
      assert_raise Ecto.NoResultsError, fn -> Shema.get_classes!(classes.id) end
    end

    test "change_classes/1 returns a classes changeset" do
      classes = classes_fixture()
      assert %Ecto.Changeset{} = Shema.change_classes(classes)
    end
  end

  describe "classe" do
    alias Ecoles.Shema.Classes

    import Ecoles.ShemaFixtures

    @invalid_attrs %{nomclasse: nil, place: nil}

    test "list_classe/0 returns all classe" do
      classes = classes_fixture()
      assert Shema.list_classe() == [classes]
    end

    test "get_classes!/1 returns the classes with given id" do
      classes = classes_fixture()
      assert Shema.get_classes!(classes.id) == classes
    end

    test "create_classes/1 with valid data creates a classes" do
      valid_attrs = %{nomclasse: "some nomclasse", place: 42}

      assert {:ok, %Classes{} = classes} = Shema.create_classes(valid_attrs)
      assert classes.nomclasse == "some nomclasse"
      assert classes.place == 42
    end

    test "create_classes/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Shema.create_classes(@invalid_attrs)
    end

    test "update_classes/2 with valid data updates the classes" do
      classes = classes_fixture()
      update_attrs = %{nomclasse: "some updated nomclasse", place: 43}

      assert {:ok, %Classes{} = classes} = Shema.update_classes(classes, update_attrs)
      assert classes.nomclasse == "some updated nomclasse"
      assert classes.place == 43
    end

    test "update_classes/2 with invalid data returns error changeset" do
      classes = classes_fixture()
      assert {:error, %Ecto.Changeset{}} = Shema.update_classes(classes, @invalid_attrs)
      assert classes == Shema.get_classes!(classes.id)
    end

    test "delete_classes/1 deletes the classes" do
      classes = classes_fixture()
      assert {:ok, %Classes{}} = Shema.delete_classes(classes)
      assert_raise Ecto.NoResultsError, fn -> Shema.get_classes!(classes.id) end
    end

    test "change_classes/1 returns a classes changeset" do
      classes = classes_fixture()
      assert %Ecto.Changeset{} = Shema.change_classes(classes)
    end
  end

  describe "matieres" do
    alias Ecoles.Shema.Matiere

    import Ecoles.ShemaFixtures

    @invalid_attrs %{coef: nil, nommatiere: nil}

    test "list_matieres/0 returns all matieres" do
      matiere = matiere_fixture()
      assert Shema.list_matieres() == [matiere]
    end

    test "get_matiere!/1 returns the matiere with given id" do
      matiere = matiere_fixture()
      assert Shema.get_matiere!(matiere.id) == matiere
    end

    test "create_matiere/1 with valid data creates a matiere" do
      valid_attrs = %{coef: 42, nommatiere: "some nommatiere"}

      assert {:ok, %Matiere{} = matiere} = Shema.create_matiere(valid_attrs)
      assert matiere.coef == 42
      assert matiere.nommatiere == "some nommatiere"
    end

    test "create_matiere/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Shema.create_matiere(@invalid_attrs)
    end

    test "update_matiere/2 with valid data updates the matiere" do
      matiere = matiere_fixture()
      update_attrs = %{coef: 43, nommatiere: "some updated nommatiere"}

      assert {:ok, %Matiere{} = matiere} = Shema.update_matiere(matiere, update_attrs)
      assert matiere.coef == 43
      assert matiere.nommatiere == "some updated nommatiere"
    end

    test "update_matiere/2 with invalid data returns error changeset" do
      matiere = matiere_fixture()
      assert {:error, %Ecto.Changeset{}} = Shema.update_matiere(matiere, @invalid_attrs)
      assert matiere == Shema.get_matiere!(matiere.id)
    end

    test "delete_matiere/1 deletes the matiere" do
      matiere = matiere_fixture()
      assert {:ok, %Matiere{}} = Shema.delete_matiere(matiere)
      assert_raise Ecto.NoResultsError, fn -> Shema.get_matiere!(matiere.id) end
    end

    test "change_matiere/1 returns a matiere changeset" do
      matiere = matiere_fixture()
      assert %Ecto.Changeset{} = Shema.change_matiere(matiere)
    end
  end
end
