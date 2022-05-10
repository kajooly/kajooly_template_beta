defmodule KajoolyTemplateBetaWeb.RolesLive.EditUsers do
  use KajoolyTemplateBetaWeb, :live_view

  import KajoolyTemplateBetaWeb.GenericLive.Breadcrum
  import KajoolyTemplateBetaWeb.GenericLive.List
  import KajoolyTemplateBetaWeb.GenericLive.Icons
  import KajoolyTemplateBetaWeb.GenericLive.Tabs
  import KajoolyTemplateBetaWeb.RolesLive.Config

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, list: list(), config: config(socket) )}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Lista de tareas")
    |> assign(:task, nil)
  end

  def list() do
    [
      %{
        id: "0001",
        title: "Nombre del usuario",
        subtitle: "mail@email.com "
      },%{
        id: "0002",
        title: "Nombre del usuario",
        subtitle: "mail@email.com "
      },%{
        id: "0003",
        title: "Nombre del usuario",
        subtitle: "mail@email.com "
      },%{
        id: "0004",
        title: "Nombre del usuario",
        subtitle: "mail@email.com "
      },

    ]
  end
  def config(socket) do
    roles_config(socket)
  end
end
