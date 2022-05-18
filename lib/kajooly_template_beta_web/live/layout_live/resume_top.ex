
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
    %{
      txt_bc_title: "Identidades",
      txt_bc_title_2: "Identidad",
      txt_bc_title_3: "Resumen ",
      txt_bc_title_4: "d.alias",
      txt_resource_name: "d.alias",
      to_index: "#",
      to_this:  "#",
      txt_count_a: "3",
      txt_a: "Llaves activas",
      txt_a_color: "warning",
      txt_count_b: "3",
      txt_b: "Accesos activos",
      txt_b_color: "success",
    }
  ## Examples

    <.resume_top_two_elemnts
      {%{
        txt_bc_title: "Identidades",
        txt_bc_title_2: "Identidad",
        txt_bc_title_3: "Resumen ",
        txt_bc_title_4: "d.alias",
        txt_resource_name: "d.alias",
        to_index: "#",
        to_this:  "#",
        txt_count_a: "3",
        txt_a: "Llaves activas",
        txt_a_color: "warning",
        txt_count_b: "3",
        txt_b: "Accesos activos",
        txt_b_color: "success",
      }}
    >
      <:icon_a>
        <.icons_person_rolodex class="flex-2 mt-2 ms-2 me-3" width="64" height="64" />
      </:icon_a>
      <:icon_b>
        <.icons_check_circle class="flex-2 mt-2 mxms-2 -e " width="64" height="64" />
      </:icon_b>
    </.resume_top_two_elemnts>

  """
  def resume_top_two_elemnts(assigns) do
    ~H"""
      <.breadcrum to={assigns[:to_index]} >
        <%= assigns[:txt_bc_title] %>
        <:page to={assigns[:to_index]}><%= assigns[:txt_bc_title_2] %></:page>
        <:page to={assigns[:to_this]}><%= assigns[:txt_bc_title_3] %></:page>
        <:page> <%= assigns[:txt_bc_title_4] %> </:page>
      </.breadcrum>

      <div class="row px-2">
        <div class="col">
          <div class="row mb-0 mb-md-3">
            <div class={"col-12 col-md-#{ if assigns[:txt_count_b] != nil do "6" else "9" end } d-flex "}>
              <div class="flex-2 pt-3">
                <%= live_patch to: assigns[:to_edit_recurse], class: "btn" do %>
                  <.icons_pencil_square />
                <% end %>
              </div>
              <div class="flex-1">
                <h4 class="mt-3 mb-0">
                <%= assigns[:txt_title] || "txt_title" %>
                </h4>
                <p class="fs-5 text-muted "><%= assigns[:txt_subtitle] || "txt_subtitle" %> </p>
              </div>
            </div>
            <div class="col-6 col-md-3  ">
              <div class={"card rounded-3 border-#{assigns[:txt_a_color] || "primary" } text-#{assigns[:txt_a_color] || "primary" }"}>
                <div class="card-body p-1 d-flex ps-2">
                  <%= render_slot(@icon_a) %>
                  <div class="flex-1">
                    <h3 class={"m-0 text-#{assigns[:txt_a_color] || "primary" } text-center"}><%= assigns[:txt_count_a] || "txt_count_a"  %> </h3>
                    <p class="m-0 text-muted fs-6 text-end">
                    <%= assigns[:txt_a] || "txt_a" %>
                    </p>
                  </div>
                </div>
              </div>
            </div>
            <%= if assigns[:txt_count_b] != nil do %>
            <div class="col-6 col-md-3  ">
              <div class={"card rounded-3 border-#{assigns[:txt_b_color] || "primary" } text-#{assigns[:txt_b_color] || "primary" }"}>
                <div class="card-body p-1 d-flex ps-2">
                  <%= render_slot(@icon_b) %>
                  <div class="flex-1">
                    <h3 class={"m-0 text-#{assigns[:txt_b_color] || "primary" } text-center"}><%= assigns[:txt_count_b] || "txt_count_b" %> </h3>
                    <p class="m-0 text-muted fs-6 text-end">
                      <%= assigns[:txt_b] || "txt_b" %>
                    </p>
                  </div>
                </div>
              </div>
            </div>
            <% end %>
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
    @doc """
    %{
      txt_bc_title: "Identidades",
      txt_bc_title_2: "Identidad",
      txt_bc_title_3: "Resumen ",
      txt_bc_title_4: "d.alias",
      txt_resource_name: "d.alias",
      to_index: "#",
      to_this:  "#"
    }
  ## Examples

    <.resume_top_two_elemnts
      {%{
        txt_bc_title: "Identidades",
        txt_bc_title_2: "Identidad",
        txt_bc_title_3: "Resumen ",
        txt_bc_title_4: "d.alias",
        txt_resource_name: "d.alias",
        to_index: "#",
        to_this:  "#"
      }}
    />

  """
  def resume_top_title(assigns) do
    ~H"""
      <.breadcrum to={assigns[:to_index]||"#to_index"} >
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
          </div>
        </div>
      </div>
    """

  end


@doc """
    %{
      txt_bc_title: "Identidades",
      txt_bc_title_2: "Identidad",
      txt_bc_title_3: "Resumen ",
      txt_bc_title_4: "d.alias",
      txt_resource_name: "d.alias",
      to_index: "#",
      to_this:  "#",
      txt_count_a: "3",
      txt_a: "Llaves activas",
      txt_a_color: "warning",
      txt_count_b: "3",
      txt_b: "Accesos activos",
      txt_b_color: "success",
    }
  ## Examples

    <.resume_top_elemnts
      {%{
        txt_bc_title: "Identidades",
        txt_bc_title_2: "Identidad",
        txt_bc_title_3: "Resumen ",
        txt_bc_title_4: "d.alias",
        txt_resource_name: "d.alias",
        to_index: "#",
        to_this:  "#",
        txt_count_a: "3",
        txt_a: "Llaves activas",
        txt_a_color: "warning",
        txt_count_b: "3",
        txt_b: "Accesos activos",
        txt_b_color: "success",
      }}
    >
      <:card>
        <.icons_person_rolodex class="flex-2 mt-2 ms-2 me-3" width="64" height="64" />
      </:icon>
      <:icon>
        <.icons_check_circle class="flex-2 mt-2 mxms-2 -e " width="64" height="64" />
      </:icon>
    </.resume_top_elemnts>

  """
  def resume_top_elemnts(assigns) do
    assigns = assigns
              |> assign_new(:cards, fn -> [] end)
    ~H"""
      <.breadcrum to={assigns[:to_index]} pages={assigns[:breadcrum_pages]}>
        <%= assigns[:txt_breadcrum_title] %>
      </.breadcrum>
      <div class="row px-2">
        <div class="col">
          <div class="row mb-0 mb-md-3">
            <div class="col-12 col-md-3 col-lg-4 d-flex ">
              <%= if assigns[:to_edit] != nil do %>
                <%= live_patch to: assigns[:to_edit], class: " flex-2 btn px-2 mx-0" do %>
                  <.icons_pencil_square class="mt-3" />
                <% end  %>
              <% end %>
              <div class="flex-1">
                <h4 class="mt-3 mb-0">
                <%= assigns[:txt_title] %>
                </h4>
                <p class="fs-5 text-muted "><%= assigns[:txt_subtitle] %> </p>
              </div>
            </div>

            <div class="col-12   col-md-9 col-lg-8 ">
              <div class="row  ">
              <%= for card <- @cards  do %>
                <div class="col-6 col-md-4">
                  <div class={"card rounded-3 border-#{ card[:color] || "primary"} text-#{ card[:color] || "primary"}"}>
                    <div class="card-body p-1 d-flex ps-2">
                      <%= render_slot(card) %>
                      <div class="flex-1">
                        <h3 class={"m-0 text-#{ card[:color] || "primary"} text-center fs-1 my-2"}>
                          <%= card[:title] %>
                        </h3>
                        <p class="m-0 text-muted fs-6 text-end">
                          <%= card[:subtitle] %>
                      </p>
                      </div>
                    </div>
                  </div>
                </div>
                <% end %>
              </div>
            </div>
          </div>
        </div>
      </div>

    """

  end
end
