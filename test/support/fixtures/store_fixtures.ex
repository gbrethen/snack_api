defmodule SnacksApi.StoreFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `SnacksApi.Store` context.
  """

  @doc """
  Generate a snack.
  """
  def snack_fixture(attrs \\ %{}) do
    {:ok, snack} =
      attrs
      |> Enum.into(%{
        brand: "some brand",
        origin: "some origin",
        quantity: 42,
        style: "some style"
      })
      |> SnacksApi.Store.create_snack()

    snack
  end
end
