defmodule KajoolyTemplateBetaWeb.RolesLive.EditPermissions do
  use KajoolyTemplateBetaWeb, :live_view

  import KajoolyTemplateBetaWeb.GenericLive.Breadcrum
  import KajoolyTemplateBetaWeb.GenericLive.List
  import KajoolyTemplateBetaWeb.GenericLive.Dropdown
  import KajoolyTemplateBetaWeb.GenericLive.Icons
  import KajoolyTemplateBetaWeb.GenericLive.Inputsearch
  import KajoolyTemplateBetaWeb.GenericLive.Tabs

  import KajoolyTemplateBetaWeb.LayoutLive.TaskList
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

  #@impl true
  #def handle_event("delete", %{"id" => id}, socket) do
  #  task = Examples.get_task!(id)
  #  {:ok, _} = Examples.delete_task(task)
#
  #  {:noreply, assign(socket, :tasks, tasks(socket))}
  #end

  def list() do
    [
      %{
        id: "0001",
        title: "Nombre del permiso",
        subtitle: "Descripcion a 140 caracteres del permiso para activar o desactivar ",
        checked: true
      },%{
        id: "0002",
        title: "Nombre del permiso 2",
        subtitle: "Descripcion a 140 caracteres del permiso para activar o desactivar ",
        checked: true
      },%{
        id: "0003",
        title: "Nombre del permiso 3",
        subtitle: "Descripcion a 140 caracteres del permiso para activar o desactivar ",
        checked: false
      },%{
        id: "0004",
        title: "Nombre del permiso 4",
        subtitle: "Descripcion a 140 caracteres del permiso para activar o desactivar ",
        checked: false
      },

    ]
  end
  def config(socket) do
    roles_config(socket)
  end
end
