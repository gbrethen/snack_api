# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     SnacksApi.Repo.insert!(%SnacksApi.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
SnacksApi.Repo.insert!(%SnacksApi.Store.Snack{
  brand: "Doritos",
  style: "Nach Corn Chip",
  origin: "USA",
  quantity: 800
})

SnacksApi.Repo.insert!(%SnacksApi.Store.Snack{
  brand: "Hilo",
  style: "Keto almond Chip",
  origin: "USA",
  quantity: 1500
})

SnacksApi.Repo.insert!(%SnacksApi.Store.Snack{
  brand: "Bhuja",
  style: "Mix",
  origin: "Australia",
  quantity: 900
})
