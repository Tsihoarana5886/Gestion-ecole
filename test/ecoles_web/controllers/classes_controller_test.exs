defmodule EcolesWeb.ClassesControllerTest do
  use EcolesWeb.ConnCase

  import Ecoles.ShemaFixtures

  @create_attrs %{nomclasse: "some nomclasse", place: 42}
  @update_attrs %{nomclasse: "some updated nomclasse", place: 43}
  @invalid_attrs %{nomclasse: nil, place: nil}

  describe "index" do
    test "lists all classe", %{conn: conn} do
      conn = get(conn, Routes.classes_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Classe"
    end
  end

  describe "new classes" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.classes_path(conn, :new))
      assert html_response(conn, 200) =~ "New Classes"
    end
  end

  describe "create classes" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.classes_path(conn, :create), classes: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.classes_path(conn, :show, id)

      conn = get(conn, Routes.classes_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Classes"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.classes_path(conn, :create), classes: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Classes"
    end
  end

  describe "edit classes" do
    setup [:create_classes]

    test "renders form for editing chosen classes", %{conn: conn, classes: classes} do
      conn = get(conn, Routes.classes_path(conn, :edit, classes))
      assert html_response(conn, 200) =~ "Edit Classes"
    end
  end

  describe "update classes" do
    setup [:create_classes]

    test "redirects when data is valid", %{conn: conn, classes: classes} do
      conn = put(conn, Routes.classes_path(conn, :update, classes), classes: @update_attrs)
      assert redirected_to(conn) == Routes.classes_path(conn, :show, classes)

      conn = get(conn, Routes.classes_path(conn, :show, classes))
      assert html_response(conn, 200) =~ "some updated nomclasse"
    end

    test "renders errors when data is invalid", %{conn: conn, classes: classes} do
      conn = put(conn, Routes.classes_path(conn, :update, classes), classes: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Classes"
    end
  end

  describe "delete classes" do
    setup [:create_classes]

    test "deletes chosen classes", %{conn: conn, classes: classes} do
      conn = delete(conn, Routes.classes_path(conn, :delete, classes))
      assert redirected_to(conn) == Routes.classes_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.classes_path(conn, :show, classes))
      end
    end
  end

  defp create_classes(_) do
    classes = classes_fixture()
    %{classes: classes}
  end
end
