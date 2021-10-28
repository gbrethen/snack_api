defmodule SnacksApi.StoreTest do
  use SnacksApi.DataCase

  alias SnacksApi.Store

  describe "snacks" do
    alias SnacksApi.Store.Snack

    import SnacksApi.StoreFixtures

    @invalid_attrs %{brand: nil, origin: nil, quantity: nil, style: nil}

    test "list_snacks/0 returns all snacks" do
      snack = snack_fixture()
      assert Store.list_snacks() == [snack]
    end

    test "get_snack!/1 returns the snack with given id" do
      snack = snack_fixture()
      assert Store.get_snack!(snack.id) == snack
    end

    test "create_snack/1 with valid data creates a snack" do
      valid_attrs = %{brand: "some brand", origin: "some origin", quantity: 42, style: "some style"}

      assert {:ok, %Snack{} = snack} = Store.create_snack(valid_attrs)
      assert snack.brand == "some brand"
      assert snack.origin == "some origin"
      assert snack.quantity == 42
      assert snack.style == "some style"
    end

    test "create_snack/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Store.create_snack(@invalid_attrs)
    end

    test "update_snack/2 with valid data updates the snack" do
      snack = snack_fixture()
      update_attrs = %{brand: "some updated brand", origin: "some updated origin", quantity: 43, style: "some updated style"}

      assert {:ok, %Snack{} = snack} = Store.update_snack(snack, update_attrs)
      assert snack.brand == "some updated brand"
      assert snack.origin == "some updated origin"
      assert snack.quantity == 43
      assert snack.style == "some updated style"
    end

    test "update_snack/2 with invalid data returns error changeset" do
      snack = snack_fixture()
      assert {:error, %Ecto.Changeset{}} = Store.update_snack(snack, @invalid_attrs)
      assert snack == Store.get_snack!(snack.id)
    end

    test "delete_snack/1 deletes the snack" do
      snack = snack_fixture()
      assert {:ok, %Snack{}} = Store.delete_snack(snack)
      assert_raise Ecto.NoResultsError, fn -> Store.get_snack!(snack.id) end
    end

    test "change_snack/1 returns a snack changeset" do
      snack = snack_fixture()
      assert %Ecto.Changeset{} = Store.change_snack(snack)
    end
  end
end
