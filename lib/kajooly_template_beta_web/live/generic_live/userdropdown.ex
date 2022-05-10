defmodule KajoolyTemplateBetaWeb.GenericLive.Dropdownrounded do
  import Phoenix.LiveView
  import Phoenix.LiveView.Helpers
  @doc """

  Dropdown

  Live Controler code:

    import KajoolyTemplateBetaWeb.GenericLive.Dropdownrounded

  ## Examples

      <!-- Simple -->
      <.dropdown>
        Título del dropdown
        <:options to="#algo1">
          algo
        </:options>
        <:options to="#algo2" selected="true">
          algo2
        </:options>
      </.dropdown>

  """

  def dropdownrounded (assigns) do
    ~H"""
      <div class="dropdown">
        <button class="btn btn-secondary rounded-circle dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">

          <%= render_slot(  @inner_block ) %>
        </button>
        <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
        <%= for option  <- @options  do %>
          <li>
            <%= live_patch to: option[:to], class: "dropdown-item  #{ if option[:selected] == "true" do "active" end }" do %>
              <%= render_slot(  option ) %>
            <%  end %>
          </li>
        <%  end %>
        </ul>
      </div>
    """
  end
end
