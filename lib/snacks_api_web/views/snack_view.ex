defmodule SnacksApiWeb.SnackView do
  use SnacksApiWeb, :view
  alias SnacksApiWeb.SnackView

  def render("index.json", %{snacks: snacks}) do
    %{data: render_many(snacks, SnackView, "snack.json")}
  end

  def render("show.json", %{snack: snack}) do
    %{data: render_one(snack, SnackView, "snack.json")}
  end

  def render("snack.json", %{snack: snack}) do
    %{
      id: snack.id,
      brand: snack.brand,
      style: snack.style,
      origin: snack.origin,
      quantity: snack.quantity
    }
  end
end
