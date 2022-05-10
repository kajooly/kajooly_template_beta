defmodule KajoolyTemplateBetaWeb.LayoutLive.Index do
  use KajoolyTemplateBetaWeb, :live_view
  import KajoolyTemplateBetaWeb.GenericLive.Helperstbot
  import KajoolyTemplateBetaWeb.GenericLive.Breadcrum
  import KajoolyTemplateBetaWeb.GenericLive.KjlModal

  @impl true
  def mount(_args, _session, socket) do
    {:ok, assign(socket, :nodes, map())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "View Layout")
  end

  defp apply_action(socket, :modal, _params) do
    socket
    |> assign(:page_title, "View Layout")
  end


  def map do

    [
      %{
        node: "prueba1",
        type: "dev",
        name: "prueba",
        description: "Descripcion de algo",
        notes: "General",
        env: "dev",
        price: "1293.123"
      },
      %{
        node: "prueba1",
        type: "dev",
        name: "prueba",
        description: "Descripcion de algo",
        notes: "General",
        env: "dev",
        price: "1293.123"
      },
      %{
        node: "prueba1",
        type: "dev",
        name: "prueba",
        description: "Descripcion de algo",
        notes: "General",
        env: "dev",
        price: "1293.123"
      },
      %{
        node: "prueba1",
        type: "dev",
        name: "prueba",
        description: "Descripcion de algo",
        notes: "General",
        env: "dev",
        price: "1293.123"
      }

    ]
  end

end
