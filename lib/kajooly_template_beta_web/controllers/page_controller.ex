defmodule KajoolyTemplateBetaWeb.PageController do
  use KajoolyTemplateBetaWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
