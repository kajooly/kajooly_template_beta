defmodule KajoolyTemplateBetaWeb.TicketsLive.Index do
  use KajoolyTemplateBetaWeb, :live_view

  import KajoolyTemplateBetaWeb.TicketsLive.Config
  import KajoolyTemplateBetaWeb.LayoutLive.TicketsLayout
  import KajoolyTemplateBetaWeb.GenericLive.Icons

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket,  assigns: config(socket,%{list: nil}) )}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Lista de tickets")
  end

  #@impl true
  #def handle_event("delete", %{"id" => id}, socket) do
  #  task = Examples.get_task!(id)
  #  {:ok, _} = Examples.delete_task(task)
#
  #  {:noreply, assign(socket, :tasks, tasks(socket))}
  #end


  def config(socket,data) do
    list_config(socket,data)
  end

end
