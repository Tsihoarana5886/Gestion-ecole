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
end
