defmodule KajoolyTemplateBetaWeb.ExampleContactListLive.Index do
  use KajoolyTemplateBetaWeb, :live_view

  import KajoolyTemplateBetaWeb.ExampleContactListLive.Config
  import KajoolyTemplateBetaWeb.GenericLive.Icons
  import KajoolyTemplateBetaWeb.GenericLive.Breadcrum
  import KajoolyTemplateBetaWeb.LayoutLive.ContactListLayout
  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket,  roles: roles(socket), assigns: config(socket) )}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end



  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Paga Example")
  end

  #@impl true
  #def handle_event("delete", %{"id" => id}, socket) do
  #  task = Examples.get_task!(id)
  #  {:ok, _} = Examples.delete_task(task)
#
  #  {:noreply, assign(socket, :tasks, tasks(socket))}
  #end

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
    examples_config(socket)
  end
end
