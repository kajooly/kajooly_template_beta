defmodule KajoolyTemplateBetaWeb.GenericLive.Breadcrum do
  import Phoenix.LiveView
  import Phoenix.LiveView.Helpers

  @doc """

  Breadcrum

  Live Controler code:

    import KajoolyTemplateBetaWeb.GenericLive.Breadcrum

  ## Examples

      <.breadcrum>
          Breadcrum title
      </.breadcrum>

      <.breadcrum to="#" >
          Return
      </.breadcrum>

      <.breadcrum pages={[
          %{ title: "Lista de contactos", to: "#contact" },
          %{ title: "Ver contecto", to: "#contact-view" },
          %{ title: "NOMBRE DEL CONTECTO", to: nil },
          ]}>
          Return
      </.breadcrum>
      <.breadcrum to="#" >
          Section page
          <:page to="#">Page name</:page>
          <:page to="#">Page name</:page>
      <!-- you can place more than one tag :page -->
          <:page >Final page name</:page>
      </.breadcrum>

  """
  def breadcrum(assigns) do
    assigns = assign_new(assigns, :page, fn -> assigns[:pages] || [] end)
    ~H"""
    <div class="row">
      <div class="col-12">
        <div class="page-title-box">
          <%= if assigns[:to] == nil do %>
            <h4 class="page-title">
              <%= render_slot(@inner_block) %>
            </h4>
          <% else  %>
            <%= live_patch to: assigns[:to], class: "page-title" do %>
              <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-left-short" viewBox="0 0 16 16">
                  <path fill-rule="evenodd" d="M12 8a.5.5 0 0 1-.5.5H5.707l2.147 2.146a.5.5 0 0 1-.708.708l-3-3a.5.5 0 0 1 0-.708l3-3a.5.5 0 1 1 .708.708L5.707 7.5H11.5a.5.5 0 0 1 .5.5z"/>
              </svg>
              <%= render_slot(@inner_block) %>
            <% end  %>
          <% end %>
          <div class="page-title-right">
            <ol class="breadcrumb m-0">
              <%= if @page != nil do %>
                <%= for item <- @page do %>
                  <%= if item[:to] == nil do %>
                    <li class="breadcrumb-item active">
                      <%= item[:title] || render_slot(item) %>
                    </li>
                  <% else %>
                    <li class="breadcrumb-item">
                      <%= live_patch to: item[:to] do %>
                        <%= item[:title] || render_slot(item) %>
                      <% end %>
                    </li>
                  <% end %>
                <% end %>
              <% end %>
            </ol>
          </div>
        </div>
      </div>
    </div>
    """
  end

end
