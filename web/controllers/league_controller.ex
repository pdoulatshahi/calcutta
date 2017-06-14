defmodule Calcutta.LeagueController do
  use Calcutta.Web, :controller

  alias Calcutta.League

  def new(conn, _params) do
    changeset = League.changeset(%League{})
    render(conn, "new.html", changeset: changeset)
  end

end
