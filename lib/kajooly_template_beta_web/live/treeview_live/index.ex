defmodule KajoolyTemplateBetaWeb.TreeviewLive.Index do
  use KajoolyTemplateBetaWeb, :live_view

  import KajoolyTemplateBetaWeb.TreeviewLive.Config
  import KajoolyTemplateBetaWeb.LayoutLive.TreeviewLayout

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket,  roles: roles(socket), config: config(socket) )}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Tree View Page")
  end

  def roles(socket) do
    [
      %{
        id: "0001",
        title: "Título 1",
        subtitle: "0",
        to: "#",
        color:  "info"
      },
      %{
        id: "0002",
        title: "Administrador",
        subtitle: "3",
        to: "#",
        color:  "info"
      },
      %{
        id: "0003",
        title: "Diseño",
        subtitle: "5",
        to: "#",
        color:  "info"
      },

    ]
  end

  def config(socket) do
    treeview_config(socket)
  end
end
