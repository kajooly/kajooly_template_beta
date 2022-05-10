defmodule KajoolyTemplateBetaWeb.GenericLive.Table do
  import Phoenix.LiveView
  import Phoenix.LiveView.Helpers

  @doc """

      Table

  Live Controler code:

    import KajoolyTemplateBetaWeb.GenericLive.Table

  ## Examples

    <.table rows={events()}>
      <:col let={user} label="Name">
        <%= user.name %>
      </:col>

      <:col let={user} label="Address">
        <%= user.address %>
      </:col>
    </.table>

  """

  def table(assigns) do
    ~H"""
    <table>
      <tr>
        <%= for col <- @col do %>
          <th><%= col.label %></th>
        <% end %>
      </tr>
      <%= for row <- @rows do %>
        <tr>
          <%= for col <- @col do %>
            <td><%= render_slot(col, row) %></td>
          <% end %>
        </tr>
      <% end %>
    </table>
    """
  end

end
