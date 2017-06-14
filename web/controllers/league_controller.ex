defmodule Calcutta.LeagueController do
  use Calcutta.Web, :controller

  alias Calcutta.League
  alias Calcutta.LeagueUser

  def new(conn, _params) do
    changeset = League.changeset(%League{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"league" => league_params}) do
    changeset = League.changeset(%League{}, league_params)
    case Repo.insert(changeset) do
      {:ok, league} ->
        conn
        changeset = LeagueUser.changeset(%LeagueUser{}, %{league_id: league.id, user_id: Guardian.Plug.current_resource(conn).id, admin: true})
        case Repo.insert(changeset) do
          {:ok, assoc} ->
            conn
            |> put_flash(:info, "League created!")
            |> redirect(to: user_path(conn, :show, Guardian.Plug.current_resource(conn)))
          {:error, changeset} ->
            conn
            |> put_flash(:error, "Something happened")
            |> redirect(to: league_path(conn, :new))
        end
      {:error, changeset} ->
        conn
        |> put_flash(:error, "Something happened")
        |> redirect(to: league_path(conn, :new))
    end
  end

end
