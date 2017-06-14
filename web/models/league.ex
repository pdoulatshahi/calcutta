defmodule Calcutta.League do
  use Calcutta.Web, :model

  schema "leagues" do
    field :name, :string
    many_to_many :users, Calcutta.User, join_through: "league_users"
    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name])
    |> validate_required([:name])
  end
end
