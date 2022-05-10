defmodule KajoolyTemplateBetaWeb.ResourcesLive.Index do
  use KajoolyTemplateBetaWeb, :live_view

  import KajoolyTemplateBetaWeb.GenericLive.Breadcrum
  import KajoolyTemplateBetaWeb.GenericLive.Tabs
  import KajoolyTemplateBetaWeb.GenericLive.List
  import KajoolyTemplateBetaWeb.GenericLive.Dropdown
  import KajoolyTemplateBetaWeb.GenericLive.Icons
  import KajoolyTemplateBetaWeb.GenericLive.Badges

  import KajoolyTemplateBetaWeb.LayoutLive.TaskList
  import KajoolyTemplateBetaWeb.ResourcesLive.Config

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket,  resources: resources(socket), config: config(socket) )}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end



  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Lista de recursos")
    |> assign(:task, nil)
  end

  #@impl true
  #def handle_event("delete", %{"id" => id}, socket) do
  #  task = Examples.get_task!(id)
  #  {:ok, _} = Examples.delete_task(task)
#
  #  {:noreply, assign(socket, :tasks, tasks(socket))}
  #end

  def resources(socket) do
    [
      %{
        id: "0001",
        title: "Recurso 1",
        subtitle: "0",
        to: Routes.roles_edit_generals_path(socket, :index),
        color:  "info"
      },
      %{
        id: "0002",
        title: "Kajooly",
        subtitle: "3",
        to: Routes.roles_edit_generals_path(socket, :index)
      },
      %{
        id: "0003",
        title: "Concomsis S.A. de C.V.",
        subtitle: "5",
        to: Routes.roles_edit_generals_path(socket, :index)
      },

    ]
  end

  def config(socket) do
    resources_config(socket)
  end
end
