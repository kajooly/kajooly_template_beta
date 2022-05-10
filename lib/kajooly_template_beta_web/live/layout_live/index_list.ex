
defmodule KajoolyTemplateBetaWeb.LayoutLive.IndexList do
  import Phoenix.LiveView
  import Phoenix.LiveView.Helpers
  import KajoolyTemplateBetaWeb.GenericLive.Breadcrum
  import KajoolyTemplateBetaWeb.GenericLive.Tabs
  import KajoolyTemplateBetaWeb.GenericLive.List
  import KajoolyTemplateBetaWeb.GenericLive.Dropdown
  import KajoolyTemplateBetaWeb.GenericLive.Icons



  use Phoenix.LiveComponent

  @doc """

    import KajoolyTemplateBetaWeb.LayoutLive.IndexList

  ## Examples

      <.index_list
      color="alert"
      title={@page_title}
      section_to="#"
      to_new_ticket="#"
      title_new_ticket="Agregar Brief"

      >
      </.index_list>


  """
  def index_list(assigns) do
    ~H"""
<div class="row">
  <div class="col-12 col-md-10 col-lg-9 col-md-8 mx-auto">
    <div class="row">
      <div class="col px-0 px-md-2">
        <div class="card">
          <div class="card-body p-2">
            <div class="row">
              <div class="col-12 mb-3">
                <div class="position-relative d-flex">
                  <div class="flex-1">
                    <%= render_slot(@search) %>
                  </div>
                  <%= if assigns[:to_new_btn] != nil do %>
                    <%= live_patch to: assigns[:to_new_btn], class: "btn btn-outline-success flex-2" do %>
                      <%= assigns[:title_new_btn] %>
                    <% end %>
                  <% end %>
                </div>
              </div>
            </div>
            <div class="row">
              <div class="col-12 mx-auto px-0">
                <div class="card p-0">
                  <div class="card-body p-0 px-1">
                  <%= render_slot(@inner_block) %>
                  </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!-- end row -->
    """
  end

end
