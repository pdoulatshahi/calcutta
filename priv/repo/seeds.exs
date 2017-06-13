# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Calcutta.Repo.insert!(%Calcutta.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Calcutta.Repo
alias Calcutta.User

Repo.insert! %User{
  email: "paul.doulatshahi@gmail.com",
  password: "password"
}

Repo.insert! %User{
  email: "keith.porcaro@gmail.com",
  password: "password"
}
