defmodule KajoolyTemplateBetaWeb.TreeviewLive.Basic do
  use KajoolyTemplateBetaWeb, :live_view

  import KajoolyTemplateBetaWeb.TreeviewLive.Config
  import KajoolyTemplateBetaWeb.GenericLive.Treeviewbasic

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket,  roles: roles(socket), config: config(socket), treeviewbasicdata: treeviewbasicdata(), list_treeview: list_treeview() )}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Tree View Page")
    |> assign(:treeviewbasicdata, treeviewbasicdata())
    |> assign(:list_treeview, list_treeview())
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

  def treeviewbasicdata() do
    %{
      name: "Treeview Basic Testeando",
      directory: "basic",
    }
  end

  def list_treeview() do
    [
      %{
        alias: "treeviewbasic",
        id: "614fa707-4524-45cb-a5fa-21c6bfc8c8bd",
        name: "ejemplo",
      },
      %{
        alias: "treeviewbasic_2",
        id: "746fa707-4524-45cb-a5fa-21c6bfc8c8bd",
        name: "ejemplo 2",
      }
    ]
  end
end
