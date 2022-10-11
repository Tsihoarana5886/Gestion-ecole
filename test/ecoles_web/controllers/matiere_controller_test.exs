defmodule EcolesWeb.MatiereControllerTest do
  use EcolesWeb.ConnCase

  import Ecoles.ShemaFixtures

  @create_attrs %{coef: 42, nommatiere: "some nommatiere"}
  @update_attrs %{coef: 43, nommatiere: "some updated nommatiere"}
  @invalid_attrs %{coef: nil, nommatiere: nil}

  describe "index" do
    test "lists all matieres", %{conn: conn} do
      conn = get(conn, Routes.matiere_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Matieres"
    end
  end

  describe "new matiere" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.matiere_path(conn, :new))
      assert html_response(conn, 200) =~ "New Matiere"
    end
  end

  describe "create matiere" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.matiere_path(conn, :create), matiere: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.matiere_path(conn, :show, id)

      conn = get(conn, Routes.matiere_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Matiere"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.matiere_path(conn, :create), matiere: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Matiere"
    end
  end

  describe "edit matiere" do
    setup [:create_matiere]

    test "renders form for editing chosen matiere", %{conn: conn, matiere: matiere} do
      conn = get(conn, Routes.matiere_path(conn, :edit, matiere))
      assert html_response(conn, 200) =~ "Edit Matiere"
    end
  end

  describe "update matiere" do
    setup [:create_matiere]

    test "redirects when data is valid", %{conn: conn, matiere: matiere} do
      conn = put(conn, Routes.matiere_path(conn, :update, matiere), matiere: @update_attrs)
      assert redirected_to(conn) == Routes.matiere_path(conn, :show, matiere)

      conn = get(conn, Routes.matiere_path(conn, :show, matiere))
      assert html_response(conn, 200) =~ "some updated nommatiere"
    end

    test "renders errors when data is invalid", %{conn: conn, matiere: matiere} do
      conn = put(conn, Routes.matiere_path(conn, :update, matiere), matiere: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Matiere"
    end
  end

  describe "delete matiere" do
    setup [:create_matiere]

    test "deletes chosen matiere", %{conn: conn, matiere: matiere} do
      conn = delete(conn, Routes.matiere_path(conn, :delete, matiere))
      assert redirected_to(conn) == Routes.matiere_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.matiere_path(conn, :show, matiere))
      end
    end
  end

  defp create_matiere(_) do
    matiere = matiere_fixture()
    %{matiere: matiere}
  end
end
