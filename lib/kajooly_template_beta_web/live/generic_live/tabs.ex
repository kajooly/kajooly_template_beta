defmodule KajoolyTemplateBetaWeb.GenericLive.Tabs do
  import Phoenix.LiveView
  import Phoenix.LiveView.Helpers

  use Phoenix.LiveComponent
  @doc """

  Tab select

  Live Controler code:

    import KajoolyTemplateBetaWeb.GenericLive.Tabs

  ## Examples

      <!-- Simple -->
      <.tab_select>
        <:tab to="#" selected="true">Page name 1</:tab>
        <:tab to="#">Page name 2</:tab>
        <:tab>Page name 3</:tab>
      </.tab_select>

      <!-- Custom id -->
      <.tab_select id="OTHERID">
        Other title with out page selected
        <:tab to="#">Page name 1</:tab>
        <:tab">Page name 2</:tab>
        <:tab to="#">Page name 3</:tab>
      </.tab_select>

      <!-- badge -->
      <.tab_select>
        <:tab to="#" badge="14" selected="true">All</:tab>
        <:tab to="#" badge="34" badge_color="danger">Urgent</:tab>
        <:tab to="#">Info</:tab>
      </.tab_select>

  """
  def tab_select(assigns) do
    id = assigns[:id] || "dropdownMenuButtonTabSelect_#{to_string(Enum.random(99..999))}"
    assigns = assign_new(assigns, :tab, fn -> [] end)
    selected = Enum.find(assigns.tab, fn x -> x[:selected] != nil end)
    ~H"""
      <div class="dropdown w-100 d-block d-lg-none">
        <button class="btn btn-white bg-white border-light dropdown-toggle w-100 text-start mb-2 color-dark" type="button" id={id} data-bs-toggle="dropdown" aria-expanded="false">
          <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-down-fill" viewBox="0 0 16 16">
            <path d="M7.247 11.14 2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z"/>
          </svg>
          <%= selected[:title] || "" %> &nbsp;
           <span class={ if selected[:badge_color] != nil do "badge rounded-pill bg-#{selected[:badge_color]}" else "badge rounded-pill bg-secondary" end } ><%= selected[:badge] %></span>
        </button>
        <ul class="dropdown-menu w-100 shadow-lg" aria-labelledby={id}>
          <%= if @tab != nil do %>
            <%= for item <- @tab do %>
              <%= if item[:to] == nil do %>
                <li class="dropdown-item d-flex ">
                  <%= render_slot(item) %>
                  <%= if item[:badge] != nil do %>
                  <span class={ if item[:badge_color] != nil do " pt-1 badge rounded-pill bg-#{item[:badge_color]}" else " pt-1 badge rounded-pill bg-secondary" end } ><%= item[:badge] %></span>
                  <% end %>
                </li>
              <% else %>
              <li>
                <%= live_patch to: item[:to], class: "dropdown-item d-flex  #{ if item[:selected] == "true" do "active" end }" do %>
                  <%= render_slot(item) %>
                  <%= if item[:badge] != nil do %>
                    <span class={ if item[:badge_color] != nil do " pt-1 badge rounded-pill bg-#{item[:badge_color]}" else " pt-1 badge rounded-pill bg-secondary" end } ><%= item[:badge] %></span>
                  <% end %>
                <% end %>
              </li>
              <% end %>
            <% end %>
          <% end %>
        </ul>
      </div>
      <div class=" d-none d-lg-block">
        <ul class={"nav nav-tabs #{ assigns[:class]} "}>
          <%= if @tab != nil do %>
            <%= for item <- @tab do %>
              <%= if item[:to] == nil do %>
              <li class="nav-item">
                <div class={"nav-link text-dark"} role="button" >
                  <%= render_slot(item) %>
                  <%= if item[:badge] != nil do %>
                    <span class={ if item[:badge_color] != nil do " badge rounded-pill bg-#{item[:badge_color]}" else " badge rounded-pill bg-secondary" end } ><%= item[:badge] %></span>
                  <% end %>
                  </div>
                </li>
              <% else %>
                <li class="nav-item">
                  <%= live_patch to: item[:to], class: "nav-link #{ if item[:selected] == "true" do "active" end }" do %>
                    <%= render_slot(item) %>
                    <%= if item[:badge] != nil do %>
                      <span class={ if item[:badge_color] != nil do " badge rounded-pill bg-#{item[:badge_color]}" else " badge rounded-pill bg-secondary" end } ><%= item[:badge] %></span>
                    <% end %>
                  <% end %>
                </li>
              <% end %>
            <% end %>
          <% end %>
        </ul>
      </div>
    """
  end

end
