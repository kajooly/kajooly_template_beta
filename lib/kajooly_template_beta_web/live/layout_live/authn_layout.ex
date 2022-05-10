
defmodule KajoolyTemplateBetaWeb.LayoutLive.AuthnLayout do
  import Phoenix.LiveView
  import Phoenix.LiveView.Helpers
  import KajoolyTemplateBetaWeb.GenericLive.Breadcrum
  import KajoolyTemplateBetaWeb.GenericLive.Tabs
  import KajoolyTemplateBetaWeb.GenericLive.List
  import KajoolyTemplateBetaWeb.GenericLive.Dropdown
  import KajoolyTemplateBetaWeb.GenericLive.Icons
  import KajoolyTemplateBetaWeb.GenericLive.Badges
  import KajoolyTemplateBetaWeb.GenericLive.KjlModal
  import KajoolyTemplateBetaWeb.GenericLive.Text
  import KajoolyTemplateBetaWeb.LayoutLive.ResumeTop
  import KajoolyTemplateBetaWeb.GenericLive.Colors
  import KajoolyTemplateBetaWeb.LayoutLive.IndexList

  use Phoenix.LiveComponent

@doc """
  ## Examples

      <.resource_resume
      color="alert"
      >
      </.resource_resume>

  """
  def identity_resume(assigns) do
    ~H"""
    <.resume_top_two_elemnts {assigns} />
    <div class="row px-2">
      <.tab_select>
        <:tab to={assigns[:to_tab_resume]} selected="true">Resumen</:tab>
        <:tab to={assigns[:to_tab_rol]}>Roles</:tab>
        <:tab to={assigns[:to_tab_actions]}>Acciones</:tab>
      </.tab_select>
    </div>
    <div class="row p-2 bg-white">
      <div class="col-12 col-md-6 col-lg-7">
        <div class="card  shadow mb-2">
          <div class="card-body d-flex w-100  p-2">
            <p class="fs-4 mb-0 flex-1 pt-1 ps-2 pb-0" class="flex-1 m-0 p-0">
            Simple Key
            </p>
            <%= live_patch to: assigns[:to_tab_rol], class: "btn btn-outline-purple flex-2" do %>
              <.icons_outline_gear /> Configurar roles
            <% end %>
          </div>
          <div class="card-body w-100  p-2">

            <div class="accordion w-100" id="accordionRoles">
            <%= if length(assigns[:list_a]) > 0 do %>
              <%= for rol <-  assigns[:list_a] do %>
                <% #= inspect rol %>
                <% id = gen_id_key() %>
                <div class="accordion-item">
                  <h2 class="accordion-header d-flex border-bottom" id="headingTwo">
                    <button class="accordion-button collapsed flex-1" type="button" data-bs-toggle="collapse"
                        data-bs-target={"#rol_#{id}"} aria-expanded="false" aria-controls={"rol_#{id}"}>
                      <.icons_person_rolodex class="text-primary me-2" />
                      <%= rol.name %>
                      <.badges color={ if length(rol.resource_rol_activity) > 0 do "primary ms-2" else "light text-muted ms-2" end } >
                        <%= if length(rol.resource_rol_activity) > 0 do "#{length(rol.resource_rol_activity)} Acciones" else "Sin acciones" end %>
                      </.badges>
                    </button>
                    <%= live_patch to: rol[:to] || "#", class: "btn flex-2" do %>
                      <.icons_pencil_square class="mt-1" />
                    <% end %>
                  </h2>
                  <div id={"rol_#{id}"} class="accordion-collapse  collapse" aria-labelledby="headingTwo"
                      data-bs-parent="#accordionRoles">
                      <div class="accordion-body bg-light py-2 px-2 ">
                        <%= if length(rol.resource_rol_activity) > 0 do %>
                          <div class="table-responsive bg-white border rounded shadow">
                            <table class="table table-sm table-centered mb-0 font-14">
                                <thead class="table-dark">
                                    <tr >
                                        <th colspan="2"  class="text-center">Acciones</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <%= for rra <-  rol.resource_rol_activity do %>
                                    <tr>
                                        <td class="text-end"><%= rra.resource_activity.name %> </td>
                                        <td class="text-success text-center">
                                          <.icons_check_circle />
                                        </td>

                                    </tr>
                                    <% end %>
                                </tbody>
                            </table>
                        </div>
                        <% else %>
                          <div class="alert alert-warning alert-dismissible fade show mb-3" role="alert">
                            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                            <%= assigns[:txt_no_info_rol] %>
                        </div>
                        <% end %>
                      </div>
                  </div>
                </div>
              <% end %>

            <% else %>
            <div class="alert alert-info alert-dismissible fade show m-2 m-md-4 m-lg-3 pe-4" role="alert">
              <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
              Lista de roles vacia, utilice
              <%= live_patch "Configurar roles", to: assigns[:to_tab_rol] || "#to_tab_rol" , class: "link-primary" %>
              para agregar más elementos en esta lista.
            </div>
          <% end %>
            </div>

        </div>
      </div>
      <!-- end accordion -->
    </div>
    <div class="col-12 col-md-6 col-lg-5">
      <div class="card shadow">
        <div class="card-body d-flex w-100  p-2">
          <p class="fs-4 mb-0 flex-1 pt-1 ps-2 pb-0" class="flex-1 m-0 p-0">
            Atributos
          </p>
          <%= live_patch to: assigns[:to_tab_actions] || "#", class: "btn flex-2" do %>
            <.icons_pencil_square />
          <% end %>
        </div>
        <div class="card-body w-100  p-2">
        <%= if length(assigns.list_b) > 0 do %>

          <.list let={entry} list={assigns.list_b}>
            <.item_list_title_actions to={entry.to} icon="true" class="ps-3">
              <:icon>
                <.name_user text={entry.alias} />
              </:icon>
              <:title> <%= entry.alias %></:title>
              <:subtitle> <%= entry.name %> </:subtitle>
              <:actions>
                </:actions>
            </.item_list_title_actions>
          </.list>
          <% else %>
            <div class="alert alert-info alert-dismissible fade show m-2 m-md-4 m-lg-3 pe-4" role="alert">
              <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
              Lista de acciones vacia, utilice
              <%= live_patch "configurar acciones", to: assigns[:to_tab_actions] || "#to_new_resource" , class: "link-primary" %>
              para agregar más elementos en esta lista.
            </div>
          <% end %>
        </div>
      </div>
      </div>
    </div>
    """

  end

  def identity_tab_actions (assigns) do
    #IO.inspect assigns, label: "assings resource_tab_actions"
    ~H"""
    <.resume_top_two_elemnts {assigns} />
        <div class="row px-2">
          <.tab_select>
            <:tab to={assigns[:to_tab_resume]}>Resumen</:tab>
            <:tab to={assigns[:to_tab_rol]}>Roles</:tab>
            <:tab to={assigns[:to_tab_actions]} selected="true">Acciones</:tab>
          </.tab_select>
        </div>
        <div class="row p-2 bg-white">
        <.index_list
          color="alert"
          section_to="#"
          to_new_btn={assigns[:to_new]}
          title_new_btn="+ Agregar nueva accion"
          breadcrum_title={"Acciones en  # {@resource_name}"}
          breadcrum_title_2={"Acciones"}
          breadcrum_title_2_to={"#"}
          resource_name={"@resource_name"}
        >
          <:search>
            <%= render_slot(@search) %>
            </:search>
            <:tabs>
          </:tabs>
          <%= if length(assigns[:list]) > 0 do %>

            <.list let={entry} list={assigns[:list]}>
              <.item_list_title_actions to={entry[:to]} data={entry} icon="true">
                <:icon>
                  <.name_user text={entry[:title]} />
                </:icon>
                <:title> <%= entry[:title] %> </:title>
                <:subtitle>
                    <%= entry[:subtitle] %>
                </:subtitle>
                <:actions>
                <.icons_pencil_square class="me-3 mt-2" />
                </:actions>
              </.item_list_title_actions>
            </.list>
            <% else %>
              <div class="alert alert-info alert-dismissible fade show m-2 m-md-4 m-lg-5 pe-4" role="alert">
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                Lista de acciones vacia, utilice
                <%= live_patch "+ Agregar nueva accion", to: assigns[:to_new] || "#to_new" , class: "link-primary" %>
                para agregar más elementos en esta lista.
              </div>
            <% end %>
        </.index_list>
        </div>


    """
  end

  def identity_tab_rol (assigns) do
    #{Routes.resource_resource_activity_filter_path(@socket, :resource_activity_f_edit, @resource_id,  entry[:id])}
    #IO.inspect assigns, label: "assings resource_tab_actions"
    ~H"""
    <.resume_top_two_elemnts {assigns} />
      <div class="row px-2">
        <.tab_select>
          <:tab to={assigns[:to_tab_resume]}>Resumen</:tab>
          <:tab to={assigns[:to_tab_rol]} selected="true">Roles</:tab>
          <:tab to={assigns[:to_tab_actions]} >Acciones</:tab>
        </.tab_select>
      </div>
      <div class="row p-2 bg-white">
        <.index_list
          color="alert"
          section_to="#"
          to_new_btn={assigns[:to_new]}
          title_new_btn={assigns[:txt_new_btn]}
        >
          <:search>
            <%= render_slot(@search) %>
            </:search>
            <:tabs>
          </:tabs>
          <%= if length(assigns[:list]) > 0 do %>

            <.list let={entry} list={assigns[:list]}>
              <.item_list_title_actions to={entry[:to]} data={entry} icon="true">
                <:icon>
                  <.name_user text={entry[:title]} />
                </:icon>
                <:title> <%= entry[:title] %> </:title>
                <:subtitle>
                    <%= entry[:subtitle] %>
                </:subtitle>
                <:actions>
                <.icons_pencil_square class="me-3 mt-2" />
                </:actions>
              </.item_list_title_actions>
            </.list>
            <% else %>
              <div class="alert alert-info alert-dismissible fade show m-2 m-md-4 m-lg-5 pe-4" role="alert">
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                Lista de roles vacia, utilice
                <%= live_patch assigns[:txt_new_btn], to: assigns[:to_new] || "#to_new" , class: "link-primary" %>
                para agregar más elementos en esta lista.
              </div>
            <% end %>
        </.index_list>
      </div>
    """
  end

  def identity_tab_rol_edit (assigns) do
    #{Routes.resource_resource_activity_filter_path(@socket, :resource_activity_f_edit, @resource_id,  entry[:id])}
    IO.inspect assigns.data_edit, label: "assings resource_tab_actions"
    ~H"""
    <.resume_top_two_elemnts {assigns} />
      <div class="row px-2">
        <.tab_select>
          <:tab to={assigns[:to_tab_resume]}>Resumen</:tab>
          <:tab to={assigns[:to_tab_rol]} selected="true">Roles</:tab>
          <:tab to={assigns[:to_tab_actions]} >Acciones</:tab>
        </.tab_select>
      </div>
      <div class="row p-2 px-4 bg-white">
        <div class="col-12 d-flex ">
          <%= live_patch to: assigns[:to_tab_rol] ,  class: "btn flex-2" do %>
            <.icons_arrow_left />
          <% end %>
          <h6 class="ps-2 flex-1">
            Asignado acciones al rol de <i><%=  assigns[:resource_role].name %></i>
          </h6>
        </div>
        <div class="col-12 col-md-4 d-flex">
          <div class="flex-1">

            <p class="mt-2 text-primary fs-2 mb-0">
              <%= assigns[:resource_role].name %>
            </p>
            <p class="text-secondary fs-5 mb-1">
              <%= assigns[:resource_role].alias %>
            </p>
            <p class="text-muted fs-6">
              <%= live_patch to: assigns[:to_edit] || "#to_edit" ,  class: "link-dark" do %>
              <.icons_pencil_square /> editar rol
              <% end %>
            </p>

          </div>
        </div>
        <div class="col-12 col-md-8">
          <%= render_slot(@check_box_list) %>
        </div>
      </div>
    """
  end

  def identity_list_index (assigns) do
    ~H"""
      <.breadcrum >
        <%= assigns[:txt_title] %>
        <:page> <%= assigns[:txt_page_title] %> </:page>
      </.breadcrum>
      <div class="row px-2">
        <div class="col">
          <div class="row mb-0 mb-md-3">
            <div class="col-12 col-md-9 d-flex ">
              <div class="flex-1">
                <h4 class="mt-3 mb-0">
                <%= assigns[:txt_title] || "txt_title" %>
                </h4>
                <p class="fs-5 text-muted "><%= assigns[:txt_subtitle] || "txt_subtitle" %> </p>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="row border-top bg-white p-2">
       <div class="col-12 col-md-8 mx-auto">
         <div class="row">
           <div class="col px-0 px-md-2">
             <div class="card">
               <div class="card-body p-2">
                 <div class="row">
                   <div class="col-12 p-0 px-2 d-flex">
                    <%= render_slot(@search) %>
                    <%= live_patch to: assigns[:to_new_resource] || "#to_new_resource", class: "btn btn-outline-success flex-2" do %>
                       <.icons_plus_lg />
                       <%= assigns[:txt_add_list] %>
                     <% end %>
                   </div>
                 </div>
                 <div class="row">
                   <div class="col-12 mx-auto p-3 mb-0 ">
                     <p class="fs-6 text-muted">
                       <%=  assigns[:txt_desc_index] %>
                     </p>
                   </div>
                   <div class="col-12 mx-auto px-0">
                     <div class="card p-0">
                       <div class="card-body p-0 px-1">
                         <%= if length(assigns[:list_resources]) > 0 do %>
                         <.list let={entry} list={assigns.list_resources}>
                           <.item_list_title_actions to={entry[:to]} data={entry} icon="true">
                             <:icon>
                              <.name_user text={entry[:title]} />
                            </:icon>
                             <:title> <%= entry[:title] %> </:title>
                             <:subtitle>
                              <%= entry[:subtitle] %>
                             </:subtitle>
                             <:actions>
                              <.dropdown class="float-end" class_button="btn-sm float-end ms-1 border-0">
                                <.icons_dots_vertical/>
                                <:options to={entry[:to]}>
                                  <.icons_eye class="me-2" />
                                  <%= entry[:txt_index_actions_show] %>
                                </:options>
                                <:options to={entry[:to_edit]}>
                                  <.icons_pencil_square class="me-2" />
                                  <%= entry[:txt_index_actions_edit] %>
                                </:options>
                                <:options to={entry[:to_tab_rol]}>
                                  <.icons_person_badge class="me-2" />
                                  <%= entry[:txt_index_actions_rol] %>
                                </:options>
                                <:options to={entry[:to_tab_actions]}>
                                  <.icons_people_fill class="me-2" />
                                  <%= entry[:txt_index_actions_actions] %>
                                </:options>
                              </.dropdown>
                             </:actions>
                           </.item_list_title_actions>
                         </.list>
                         <% else %>
                           <div class="alert alert-info alert-dismissible fade show m-2 m-md-4 m-lg-5 pe-4" role="alert">
                             <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                             Lista de recursos vacia, utilice
                             <%= live_patch assigns[:txt_add_list], to: assigns[:to_new_resource] || "#to_new_resource" , class: "link-primary" %>
                             para agregar más elementos en esta lista.
                           </div>
                         <% end %>
                       </div>
                     </div>
                   </div>
                 </div>
               </div>
             </div>
           </div>
         </div>
       </div>
       <div class="col-12 col-md-3 d-none d-lg-block me-auto ">
         <div class="card rounded-3 border-info text-info">
           <div class="card-body p-1 d-flex ps-2">
             <.icons_person_rolodex class="flex-2 mt-2 mxms-2 -e " width="64" height="64" />
             <div class="flex-1">
               <h3 class="m-0 text-info text-center"><%= assigns[:txt_count] || "[0]" %> </h3>
               <p class="m-0 text-muted fs-6 text-end">
                 <%= assigns[:txt_count_title] || "txt_count_title" %>
               </p>
             </div>
           </div>
         </div>
         <div class="card">
           <div class="card-body">
               <h4 class="header-title">Sistema de identidades </h4>
               <p class="sub-header">Administre en esta sección los <code>---</code> disponibles en este <code>servidor</code>. En cada identidad podrá editar los <code>---</code> y <code>---</code> con los cuales podrá administrar los usuarios en este <code>servidor</code>.
               </p>


           </div> <!-- end card-body -->
         </div>
       </div>
     </div>

    """
  end

  def identity_modal_delete (assigns) do
    ~H"""
    <div class="row">
      <div class="col">
        <p class="text-center py-1 text-warning ">
          <.icons_trash class=" mx-auto " width="64" height="64" />
        </p>
        <p class="text-center py-3">
          <%= assigns[:txt_desc] %>
        </p>
        <div class="modal-footer">
          <%= render_slot(@button) %>
          <%= live_patch assigns[:txt_btn_cancel], to: assigns[:return_to] || "#", class: "btn btn-outline-secondary"  %>
        </div>
      </div>
    </div>
    """
  end
end
