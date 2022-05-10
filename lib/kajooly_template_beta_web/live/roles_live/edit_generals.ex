defmodule KajoolyTemplateBetaWeb.RolesLive.EditGenerals do
  use KajoolyTemplateBetaWeb, :live_view

  import KajoolyTemplateBetaWeb.GenericLive.Breadcrum
  import KajoolyTemplateBetaWeb.GenericLive.List
  import KajoolyTemplateBetaWeb.GenericLive.Dropdown
  import KajoolyTemplateBetaWeb.GenericLive.Icons
  import KajoolyTemplateBetaWeb.GenericLive.Inputsearch
  import KajoolyTemplateBetaWeb.GenericLive.Tabs
  import KajoolyTemplateBetaWeb.RolesLive.Config

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, config: config(socket) )}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end



  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, config(socket)[:txt_title_generals])
    |> assign(:task, nil)
  end

  def config(socket) do
    roles_config(socket)
  end
end
