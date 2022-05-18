defmodule KajoolyTemplateBetaWeb.TicketsLive.Custom do
  use KajoolyTemplateBetaWeb, :live_view

  import KajoolyTemplateBetaWeb.TicketsLive.Config
  import KajoolyTemplateBetaWeb.LayoutLive.TicketsLayout
  import KajoolyTemplateBetaWeb.GenericLive.Icons

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, assigns: config(socket,%{list: nil}) )}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end



  defp apply_action(socket, :show, _params) do
    socket
    |> assign(:page_title, "Paga Example")
  end


  def config(socket,data) do
    custom_config(socket,data)
  end

end
