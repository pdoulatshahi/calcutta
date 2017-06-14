defmodule Calcutta.LeagueUser do
  use Calcutta.Web, :model

  schema "league_users" do
    field :admin, :boolean, default: false
    belongs_to :league, Calcutta.League
    belongs_to :user, Calcutta.User

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:admin, :league_id, :user_id])
    |> validate_required([:admin, :league_id, :user_id])
  end
end
