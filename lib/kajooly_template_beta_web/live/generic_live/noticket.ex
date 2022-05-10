defmodule KajoolyTemplateBetaWeb.GenericLive.Noticket do
  import Phoenix.LiveView
  import Phoenix.LiveView.Helpers
  @doc """

  Dropdown

  Live Controler code:

    import KajoolyTemplateBetaWeb.GenericLive.Noticket

  ## Examples

      <!-- Simple -->
      <.noticket>
      </.noticket>

  """

  def noticket (assigns) do
    ticket=assigns[:ticket] || "--"
    ~H"""
      <div class="text-end">
        <h5 class="text-secondary">No Ticket <%= ticket %></h5>
        <p class="text-secondary fs-5">Etiqueta/Rol</p>
      </div>
    """
  end
end
