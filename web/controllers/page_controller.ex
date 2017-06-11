defmodule Calcutta.PageController do
  use Calcutta.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
