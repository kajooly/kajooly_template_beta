
defmodule KajoolyTemplateBetaWeb.LayoutLive.ResumeTop do
  import Phoenix.LiveView
  import Phoenix.LiveView.Helpers

  use Phoenix.LiveComponent

  import KajoolyTemplateBetaWeb.GenericLive.Breadcrum
  import KajoolyTemplateBetaWeb.GenericLive.Tabs
  import KajoolyTemplateBetaWeb.GenericLive.List
  import KajoolyTemplateBetaWeb.GenericLive.Dropdown
  import KajoolyTemplateBetaWeb.GenericLive.Icons
  import KajoolyTemplateBetaWeb.GenericLive.Badges
  import KajoolyTemplateBetaWeb.GenericLive.KjlModal
  import KajoolyTemplateBetaWeb.GenericLive.Text

@doc """

  ## Examples

      <.resume_top_two_elemnts
      color="alert"

      >
      </.resume_top_two_elemnts>

  """
  def resume_top_two_elemnts(assigns) do
    ~H"""
      <.breadcrum to={assigns[:to_index]} >
        <%= assigns[:txt_bc_title] %>
        <:page to={assigns[:to_index]}> <%= assigns[:txt_bc_title_2] %> </:page>
        <:page to={assigns[:to_this]}> <%= assigns[:txt_bc_title_3] %> </:page>
        <:page> <%= assigns[:txt_bc_title_4] %> </:page>
      </.breadcrum>

      <div class="row px-2">
        <div class="col">
          <div class="row mb-0 mb-md-3">
            <div class="col-12 col-md-6 d-flex ">
              <div class="flex-2 pt-3">
                <%= live_patch to: assigns[:to_edit_recurse], class: "btn" do %>
                  <.icons_pencil_square />
                <% end %>
              </div>
              <div class="flex-1">
                <h4 class="mt-3 mb-0">
                <%= assigns[:txt_resource_name] %>
                </h4>
                <p class="fs-5 text-muted "><%= assigns[:txt_bc_title_4] %> </p>
              </div>
            </div>
            <div class="col-6 col-md-3  ">
              <div class="card rounded-3 border-primary text-primary">
                <div class="card-body p-1 d-flex ps-2">
                  <.icons_person_rolodex class="flex-2 mt-2 ms-2 me-3" width="64" height="64" />
                  <div class="flex-1">
                    <h3 class="m-0 text-primary text-center"><%= assigns[:txt_count_roles] %> </h3>
                    <p class="m-0 text-muted fs-6 text-end">
                      Roles disponibles
                    </p>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-6 col-md-3  ">
              <div class="card rounded-3 border-warning text-warning">
                <div class="card-body p-1 d-flex ps-2">
                  <.icons_check_circle class="flex-2 mt-2 mxms-2 -e " width="64" height="64" />
                  <div class="flex-1">
                    <h3 class="m-0 text-warning text-center"><%= assigns[:txt_count_activity] %> </h3>
                    <p class="m-0 text-muted fs-6 text-end">
                      Acciones disponibles
                    </p>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    """

  end
  @doc """

    ## Examples

        <.resume_top_one_elemnts
        color="alert"

        >
        </.resume_top_one_elemnts>

    """
    def resume_top_one_elemnts(assigns) do
      ~H"""
        <div class="row px-2">
          <div class="col">
            <div class="row mb-0 mb-md-3">
              <div class="col-12 col-md-9 d-flex ">
                <div class="flex-1">
                  <h4 class="mt-3 mb-0">
                  <%= assigns[:txt_title] %>
                  </h4>
                  <p class="fs-5 text-muted "><%= assigns[:txt_subtitle] %> </p>
                </div>
              </div>

              <div class="col-6 col-md-3  ">
                <div class="card rounded-3 border-warning text-warning">
                  <div class="card-body p-1 d-flex ps-2">
                    <.icons_check_circle class="flex-2 mt-2 mxms-2 -e " width="64" height="64" />
                    <div class="flex-1">
                      <h3 class="m-0 text-warning text-center"><%= assigns[:txt_count_activity] %> </h3>
                      <p class="m-0 text-muted fs-6 text-end">
                        Acciones disponibles
                      </p>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      """

    end
end
