defmodule SnacksApiWeb.SnackController do
  use SnacksApiWeb, :controller

  plug :accepts, ~w(html json)

  alias SnacksApi.Store
  alias SnacksApi.Store.Snack

  action_fallback SnacksApiWeb.FallbackController

  def index(conn, %{"brand" => brand}) do
    snacks = Store.get_snack_by_brand(brand)
    render(conn, "index.json", snacks: snacks)
  end

  def index(conn, _params) do
    snacks = Store.list_snacks()
    render(conn, "index.json", snacks: snacks)
  end

  def create(conn, %{"snack" => snack_params}) do
    with {:ok, %Snack{} = snack} <- Store.create_snack(snack_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.snack_path(conn, :show, snack))
      |> render("show.json", snack: snack)
    end
  end

  def show(conn, %{"id" => id}) do
    snack = Store.get_snack!(id)
    render(conn, "show.json", snack: snack)
  end

  def update(conn, %{"id" => id, "snack" => snack_params}) do
    snack = Store.get_snack!(id)

    with {:ok, %Snack{} = snack} <- Store.update_snack(snack, snack_params) do
      render(conn, "show.json", snack: snack)
    end
  end

  def delete(conn, %{"id" => id}) do
    snack = Store.get_snack!(id)

    with {:ok, %Snack{}} <- Store.delete_snack(snack) do
      send_resp(conn, :no_content, "")
    end
  end
end
