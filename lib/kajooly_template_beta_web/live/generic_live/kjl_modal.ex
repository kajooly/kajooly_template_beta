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
        <div>
          <.form
            let={f}
            for={@changeset}
            id="identity-form"
            phx-target={@myself}
            phx-change="validate"
            phx-submit="save">
            <%= hidden_input f, :k_id, value: "7a3e94c1-4084-4249-adc2-961ffecbd216" %>
            <%= error_tag f, :k_id %>

            <.kjl_label label="Alias">
              <%= textarea f, :alias, class: "form-control"  %>
              <%= error_tag f, :alias %>
            </.kjl_label>

            <.kjl_label label="Confirmación">
              <%= datetime_select f, :comfirmed_at %>
              <%= error_tag f, :comfirmed_at %>
            </.kjl_label>
              <div class="modal-footer">
                <%= if @changeset.data.id != nil do %>
                  <%= live_patch "Borrar", to: Routes.identity_index_path(@socket, :delete, f.data.id), class: "btn btn-outline-danger"  %>
                <% end %>
                <%= submit "Guardar", class: "btn btn-primary" , phx_disable_with: "Guardando..." %>
            </div>
          </.form>
        </div>

      </.kjl_modal>
  """
  def kjl_modal(assigns) do
    assigns = assign_new(assigns, :return_to, fn -> nil end)

    ~H"""
    <div id="modal" class="phx-modal fade-in" phx-remove={hide_modal()} style="z-index: 1200;">
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
