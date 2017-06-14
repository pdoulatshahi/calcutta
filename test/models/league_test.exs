defmodule Calcutta.LeagueTest do
  use Calcutta.ModelCase

  alias Calcutta.League

  @valid_attrs %{name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = League.changeset(%League{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = League.changeset(%League{}, @invalid_attrs)
    refute changeset.valid?
  end
end
