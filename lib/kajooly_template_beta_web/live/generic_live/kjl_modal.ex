defmodule KajoolyTemplateBetaWeb.GenericLive.KjlModal do
  import Phoenix.LiveView
  import Phoenix.LiveView.Helpers
  import KajoolyTemplateBetaWeb.GenericLive.Icons
  alias Phoenix.LiveView.JS

  @doc """
  Renders a live component inside a modal.

  The rendered modal receives a `:return_to` option to properly update
  the URL when the modal is closed.

  ## Examples

      <.kjl_modal return_to={Routes.ticket_index_path(@socket, :index)}>
        <.live_component
          module={PanelTpkMvpWeb.TicketLive.FormComponent}
          id={@ticket.id || :new}
          title={@page_title}
          action={@live_action}
          return_to={Routes.ticket_index_path(@socket, :index)}
          ticket: @ticket
        />
      </.kjl_modal>
  """
  def kjl_modal(assigns) do
    assigns = assign_new(assigns, :return_to, fn -> nil end)

    ~H"""
    <div id="modal" class="phx-modal fade-in" phx-remove={hide_modal()}>
      <div
        id="modal-content"
        class="phx-modal-content fade-in-scale rounded shadow-lg border-light"
        phx-click-away={JS.dispatch("click", to: "#close")}
        phx-window-keydown={JS.dispatch("click", to: "#close")}
        phx-key="escape"
      >
      <div class="d-flex w-100 mb-3 border-bottom">
        <div class="flex-1 p-2 fs-4">
          <%= assigns[:title] %>
        </div>
        <%= if @return_to do %>
          <%= live_patch to: @return_to, id: "close",
            class: "phx-modal-close p-2",
            phx_click: hide_modal()
            do
          %>
          <.icons_close/>
          <% end %>
        <% else %>
          <div class="flex-2">
            <a id="close" href="#" class="phx-modal-close p-2" phx-click={hide_modal()}>
              <.icons_close/>
            </a>
          </div>
        <% end %>
      </div>
      <%= render_slot(@inner_block) %>
      </div>
    </div>
    """
  end

  defp hide_modal(js \\ %JS{}) do
    js
    |> JS.hide(to: "#modal", transition: "fade-out")
    |> JS.hide(to: "#modal-content", transition: "fade-out-scale")
  end
end
