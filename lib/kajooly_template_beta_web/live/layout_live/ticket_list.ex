
defmodule KajoolyTemplateBetaWeb.LayoutLive.TicketList do
  import Phoenix.LiveView
  import Phoenix.LiveView.Helpers
  import KajoolyTemplateBetaWeb.GenericLive.Breadcrum
  import KajoolyTemplateBetaWeb.GenericLive.Tabs
  import KajoolyTemplateBetaWeb.GenericLive.List
  import KajoolyTemplateBetaWeb.GenericLive.Dropdown
  import KajoolyTemplateBetaWeb.GenericLive.Icons



  use Phoenix.LiveComponent

  @doc """


  ## Examples

      <.ticket_list
      color="alert"

      >
      </.ticket_list>


  """
  def ticket_list(assigns) do
    ~H"""
<.breadcrum>
<%= assigns[:title] %>
<:page to={assigns[:section_to]}><%= assigns[:section_page] %> </:page>
</.breadcrum>
<div class="row">
  <div class="col-12 col-md-10 col-lg-9 col-md-8 mx-auto">
    <div class="row">
      <div class="col px-0 px-md-2">
        <div class="card">
          <div class="card-body p-2">
            <div class="row">
              <div class="col-12 mb-3">
                <div class="position-relative">
                  <%= render_slot(@search) %>
                </div>
              </div>
            </div>
            <div class="row">
              <div class="col-10 col-md-9 p-0 ps-2 ps-md-3 pt-1">
                <%= render_slot(@tabs) %>
              </div>
              <div class="col-2 col-md-3 pt-1 ps-2  ">
                <%= if assigns[:to_new_ticket] != nil do %>
                  <%= live_patch to: assigns[:to_new_ticket], class: "btn btn-sm px-1 mb-1 btn-success rounded-pill float-end" do %>
                  <.icons_plus_lg class="float-start" width="20" height="20"  />
                    <b class=" ms-1 d-none d-md-block float-end pe-1" >
                      <%= assigns[:title_new_ticket] %>
                    </b>
                  <% end %>
                <% end %>
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
