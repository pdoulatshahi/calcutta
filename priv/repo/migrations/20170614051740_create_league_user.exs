defmodule Calcutta.Repo.Migrations.CreateLeagueUser do
  use Ecto.Migration

  def change do
    create table(:league_users) do
      add :admin, :boolean, default: false, null: false
      add :league_id, references(:leagues, on_delete: :nothing)
      add :user_id, references(:users, on_delete: :nothing)
      timestamps()
    end
    create index(:league_users, [:league_id])
    create index(:league_users, [:user_id])
    create unique_index(:league_users, [:league_id, :user_id])
  end
end
