defmodule SnacksApi.Repo.Migrations.CreateSnacks do
  use Ecto.Migration

  def change do
    create table(:snacks, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :brand, :string
      add :style, :string
      add :origin, :string
      add :quantity, :integer

      timestamps()
    end
  end
end
