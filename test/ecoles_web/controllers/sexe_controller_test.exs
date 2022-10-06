defmodule EcolesWeb.SexeControllerTest do
  use EcolesWeb.ConnCase

  import Ecoles.SexemodFixtures

  @create_attrs %{nom: "some nom"}
  @update_attrs %{nom: "some updated nom"}
  @invalid_attrs %{nom: nil}

  describe "index" do
    test "lists all sexes", %{conn: conn} do
      conn = get(conn, Routes.sexe_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Sexes"
    end
  end

  describe "new sexe" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.sexe_path(conn, :new))
      assert html_response(conn, 200) =~ "New Sexe"
    end
  end

  describe "create sexe" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.sexe_path(conn, :create), sexe: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.sexe_path(conn, :show, id)

      conn = get(conn, Routes.sexe_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Sexe"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.sexe_path(conn, :create), sexe: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Sexe"
    end
  end

  describe "edit sexe" do
    setup [:create_sexe]

    test "renders form for editing chosen sexe", %{conn: conn, sexe: sexe} do
      conn = get(conn, Routes.sexe_path(conn, :edit, sexe))
      assert html_response(conn, 200) =~ "Edit Sexe"
    end
  end

  describe "update sexe" do
    setup [:create_sexe]

    test "redirects when data is valid", %{conn: conn, sexe: sexe} do
      conn = put(conn, Routes.sexe_path(conn, :update, sexe), sexe: @update_attrs)
      assert redirected_to(conn) == Routes.sexe_path(conn, :show, sexe)

      conn = get(conn, Routes.sexe_path(conn, :show, sexe))
      assert html_response(conn, 200) =~ "some updated nom"
    end

    test "renders errors when data is invalid", %{conn: conn, sexe: sexe} do
      conn = put(conn, Routes.sexe_path(conn, :update, sexe), sexe: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Sexe"
    end
  end

  describe "delete sexe" do
    setup [:create_sexe]

    test "deletes chosen sexe", %{conn: conn, sexe: sexe} do
      conn = delete(conn, Routes.sexe_path(conn, :delete, sexe))
      assert redirected_to(conn) == Routes.sexe_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.sexe_path(conn, :show, sexe))
      end
    end
  end

  defp create_sexe(_) do
    sexe = sexe_fixture()
    %{sexe: sexe}
  end
end
