defmodule KajoolyTemplateBetaWeb.GenericLive.Form do
  import Phoenix.LiveView
  import Phoenix.LiveView.Helpers

  import KajoolyTemplateBetaWeb.GenericLive.Text

  use Phoenix.LiveComponent
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
  def kjl_label(assigns) do
    assigns = assign_new(assigns, :return_to, fn -> nil end)

    id = assigns[:id] || gen_id_key()
    ~H"""
      <div class="mb-3 mx-1 mx-md-2 ">
        <label for={"kjl_input#{id}"} class="form-label"><%= assigns[:label] || "" %></label>
        <%= render_slot(@inner_block) %>
      </div>
    """
  end
end
