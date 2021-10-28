defmodule SnacksApiWeb.SnackControllerTest do
  use SnacksApiWeb.ConnCase

  import SnacksApi.StoreFixtures

  alias SnacksApi.Store.Snack

  @create_attrs %{
    brand: "some brand",
    origin: "some origin",
    quantity: 42,
    style: "some style"
  }
  @update_attrs %{
    brand: "some updated brand",
    origin: "some updated origin",
    quantity: 43,
    style: "some updated style"
  }
  @invalid_attrs %{brand: nil, origin: nil, quantity: nil, style: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all snacks", %{conn: conn} do
      conn = get(conn, Routes.snack_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create snack" do
    test "renders snack when data is valid", %{conn: conn} do
      conn = post(conn, Routes.snack_path(conn, :create), snack: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.snack_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "brand" => "some brand",
               "origin" => "some origin",
               "quantity" => 42,
               "style" => "some style"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.snack_path(conn, :create), snack: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update snack" do
    setup [:create_snack]

    test "renders snack when data is valid", %{conn: conn, snack: %Snack{id: id} = snack} do
      conn = put(conn, Routes.snack_path(conn, :update, snack), snack: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.snack_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "brand" => "some updated brand",
               "origin" => "some updated origin",
               "quantity" => 43,
               "style" => "some updated style"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, snack: snack} do
      conn = put(conn, Routes.snack_path(conn, :update, snack), snack: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete snack" do
    setup [:create_snack]

    test "deletes chosen snack", %{conn: conn, snack: snack} do
      conn = delete(conn, Routes.snack_path(conn, :delete, snack))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.snack_path(conn, :show, snack))
      end
    end
  end

  defp create_snack(_) do
    snack = snack_fixture()
    %{snack: snack}
  end
end
