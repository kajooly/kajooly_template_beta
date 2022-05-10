defmodule KajoolyTemplateBetaWeb.LayoutLive.Events do
  use KajoolyTemplateBetaWeb, :live_view

  import KajoolyTemplateBetaWeb.GenericLive.Breadcrum
  import KajoolyTemplateBetaWeb.GenericLive.Tabs
  import KajoolyTemplateBetaWeb.GenericLive.List


  @impl true
  def mount(_args, _session, socket) do
    {:ok, assign(socket, :nodes, events())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "View Layout")
  end

  def events do
    [
      %{
        name: "asd",
        address: "address",
        date: "12/10/2022"
      }

    ]
  end

end
