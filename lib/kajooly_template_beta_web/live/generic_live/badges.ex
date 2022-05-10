defmodule KajoolyTemplateBetaWeb.GenericLive.Badges do
  import Phoenix.LiveView
  import Phoenix.LiveView.Helpers

  @doc """

  Badges

  Live Controler code:

    import KajoolyTemplateBetaWeb.GenericLive.Badges

    Colors:
      - primary
      - secomdary
      - info
      - success
      - warning
      - alert

  ## Examples

      <.badges color="alert">
          Badges title
      </.badges>


  """
  def badges(assigns) do
    ~H"""
    <span class={"badge bg-#{assigns[:color] || "secondary" } #{assigns[:class] || ""} "}><%= render_slot(@inner_block) %></span>
    """
  end

end
