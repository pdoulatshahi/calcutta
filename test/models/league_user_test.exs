defmodule Calcutta.LeagueUserTest do
  use Calcutta.ModelCase

  alias Calcutta.LeagueUser

  @valid_attrs %{admin: true}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = LeagueUser.changeset(%LeagueUser{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = LeagueUser.changeset(%LeagueUser{}, @invalid_attrs)
    refute changeset.valid?
  end
end
