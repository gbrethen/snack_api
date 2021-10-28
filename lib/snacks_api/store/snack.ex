defmodule SnacksApi.Store.Snack do
  use Ecto.Schema
  import Ecto.Changeset
  alias SnacksApi.Store.Snack

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "snacks" do
    field :brand, :string
    field :origin, :string
    field :quantity, :integer
    field :style, :string

    timestamps()
  end

  @doc false
  def changeset(%Snack{} = snack, attrs) do
    snack
    |> cast(attrs, [:brand, :style, :origin, :quantity])
    |> validate_required([:brand, :style, :origin, :quantity])
  end
end
