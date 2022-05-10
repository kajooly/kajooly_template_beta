
defmodule KajoolyTemplateBetaWeb.LayoutLive.TicketShow do
  import Phoenix.LiveView
  import Phoenix.LiveView.Helpers
  import KajoolyTemplateBetaWeb.GenericLive.Breadcrum
  import KajoolyTemplateBetaWeb.GenericLive.Tabs
  import KajoolyTemplateBetaWeb.GenericLive.List
  import KajoolyTemplateBetaWeb.GenericLive.Dropdown
  import KajoolyTemplateBetaWeb.GenericLive.Icons
  import KajoolyTemplateBetaWeb.GenericLive.Badges
  import KajoolyTemplateBetaWeb.GenericLive.Chat


  use Phoenix.LiveComponent

  @doc """


  ## Examples

      <.ticket_show
      color="alert"

      >
      </.ticket_show>


  """
  def ticket_show(assigns) do
    ~H"""
      <.breadcrum to={assigns[:back_to]}>
      <%= assigns[:title_breadcrum] %>
      <:page to={assigns[:section_to]}><%= assigns[:section_page] %> </:page>
      </.breadcrum>

      <div class="row">
        <div class="col-12">
          <div class={"card ps-1 border-0 border-start border-5 border-#{assigns[:color]||"seconday"}  "}>
            <div class="card-body row p-0">
              <div class="col-6 col-md-5 pt-1 px-2 px-md-3">
                <div class="d-flex">
                <%= if assigns[:edit_to] != nil do %>
                  <%= live_patch to: assigns[:edit_to], class: " flex-2 btn px-2 mx-0" do %>
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
                      <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
                      <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
                    </svg>
                  <% end  %>
                <% end %>
                <h4 class="m-0 flex-1">
                  <%= assigns[:title] %>
                </h4>
                </div>
                <p class="mb-2 ps-4 ms-2"><%= assigns[:name_create]||"" %> </p>
              </div>
              <div class="col-6 col-md-4 pt-1 pe-2 pe-md-0">
                <p class="mb-1 text-end"><%= assigns[:label_ticket]||"" %> <spann class="fs-3 ms-2"><%= assigns[:ease_id_ticket]||"" %></spann> </p>
                <p class="mb-1 text-end"><%= assigns[:label]||"" %> </p>
              </div>
              <div class="col-12 col-md-3 pt-1 px-2 pe-md-3">
                <p class="mb-0 text-end"><%= assigns[:date]||"" %>
                <br class="d-none d-md-block" />
                <%= assigns[:hour]||"" %></p>
                <.badges color={ assigns[:color] || "secondary" } class="float-end">
                  <%= assigns[:section]||"" %>
                </.badges>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="row mb-3">
        <div class="col-12 d-flex px-3">
          <div class="flex-2">
            <%= assigns[:label_user_list] %>
             <a href="javascript: void(0);" class="text-reset font-19 py-1 px-2 d-inline-block float-end">
                <i class="fe-user-plus" data-bs-container="#tooltip-container" data-bs-toggle="tooltip" data-bs-placement="top" title="Add Users"></i>
            </a>
            <.list_h let={entry} list={assigns[:users]} class="float-end ms-3">
              <.name_user text={entry[:title]} tooltip={entry[:subtitle]} class="me-0 " />
            </.list_h>

          </div>
          <div class="flex-1 text-end">
            <%= assigns[:label_last_update] %>  <%= assigns[:last_update] %>
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col-12 col-md-5">
          <div class="card">
            <div class="card-body">
              <div class="card-title">
                <%= assigns[:label_description] %>
              </div>
                <%= assigns[:description] %>
            </div>
            <div class="card-body">
              <%= render_slot(@inner_block) %>
            </div>
          </div>
        </div>
        <div class="col-12 col-md-7">
            <.tab_select class="mb-0">
            <:tab to="#" selected="true">Comentarios</:tab>
            <:tab to="#">Actividad</:tab>
          </.tab_select>
          <.chat />
        </div>
      </div>

      """
      end
end
