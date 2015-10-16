defmodule OvernightBackpacker.PageController do
  use OvernightBackpacker.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
