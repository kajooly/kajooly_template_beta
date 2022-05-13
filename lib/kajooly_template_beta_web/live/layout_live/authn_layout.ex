
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
    <.resume_top_two_elemnts {assigns} >
      <:icon_a>
        <.icons_key class="flex-2 mt-2 ms-2 me-3" width="64" height="64" />
      </:icon_a>
      <:icon_b>
        <.icons_door_open class="flex-2 mt-2 mxms-2 -e " width="64" height="64" />
      </:icon_b>
    </.resume_top_two_elemnts>

    <div class="row p-2 bg-white">

    <div class="col-12 col-md-6 col-lg-8 mx-auto">
      <div class="card shadow">
        <div class="card-body d-flex w-100  p-2">
          <p class="fs-4 mb-0 flex-1 pt-1 ps-2 pb-0" class="flex-1 m-0 p-0">
            Conexiones a cuentas de acceso
            <br/>
            <span class="text-muted">
            Atributos
            </span>
          </p>
          <!--
          <%= live_patch to: assigns[:to_tab_actions] || "#", class: "btn flex-2" do %>
            <.icons_pencil_square />
          <% end %>
          -->
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
              Lista de identidades vacia.
            </div>
          <% end %>
        </div>
      </div>
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
                              <.badges color="success">
                                <%= entry[:subtitle] %>
                              </.badges>
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

                                <%= # <:options to={entry[:to_tab_rol]}> %>
                                <%= #   <.icons_person_badge class="me-2" /> %>
                                <%= #   <%= entry[:txt_index_actions_rol] %>
                                <%= # </:options> %>
                                <%= # <:options to={entry[:to_tab_actions]}> %>
                                <%= #   <.icons_people_fill class="me-2" /> %>
                                <%= #   <%= entry[:txt_index_actions_actions] %>
                                <%= # </:options> %>
                              </.dropdown>
                             </:actions>
                           </.item_list_title_actions>
                         </.list>
                         <% else %>
                           <div class="alert alert-info alert-dismissible fade show m-2 m-md-4 m-lg-5 pe-4" role="alert">
                             <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                             Lista de identidades vacia, utilice
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
               <p class="sub-header">Administre en esta sección las <code>identidades</code> disponibles en este <code>servidor</code>. En cada identidad podrá ver los <code>los accesos</code> y <code>la cantidad de llaves</code> con los cuales podrá acceder esta identidad en este <code>servidor</code>.
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



  def methods_resume(assigns) do
    ~H"""
    <.resume_top_two_elemnts {assigns} >
      <:icon_a>
        <.icons_shield_lock class="flex-2 mt-2 ms-2 me-3" width="64" height="64" />
      </:icon_a>
    </.resume_top_two_elemnts>

    <div class="row p-2 bg-white">

      <div class="col-12 col-md-6 col-lg-5 mx-auto">
        <div class="card shadow">
          <div class="card-body d-flex w-100 bg-info p-2">
            <p class="fs-4 mb-0 flex-1 pt-1 ps-2 pb-0 text-white" class="flex-1 m-0 p-0">
              Detalle del método
              <br/>
            </p>
            <!--
            <%= live_patch to: assigns[:to_tab_actions] || "#", class: "btn flex-2" do %>
              <.icons_pencil_square />
            <% end %>
            -->
          </div>
          <div class="card-body w-100  p-2">
            <ol class="list-group list-group-numbered shadow-lg">
              <li class="list-group-item d-flex justify-content-between align-items-start">
                  <div class="ms-2 me-auto">
                      <div class="fw-bold">Tenant</div>
                      <code><%= assigns[:tenant_id] || "assigns[:tenant_id]" %></code>
                  </div>
              </li>
              <li class="list-group-item d-flex justify-content-between align-items-start">
                  <div class="ms-2 me-auto">
                      <div class="fw-bold">Nombre</div>
                      <%= assigns[:name] || "assigns[:name]" %>
                  </div>
              </li>
              <li class="list-group-item d-flex justify-content-between align-items-start">
                  <div class="ms-2 me-auto">
                      <div class="fw-bold">Atom</div>
                      <%= assigns[:atom] || "assigns[:atom]" %>
                  </div>
              </li>
              <li class="list-group-item d-flex justify-content-between align-items-start">
                  <div class="ms-2 me-auto">
                      <div class="fw-bold">Descripción</div>
                      <p class="border-white m-2 rounded shadow"><%= assigns[:description] || "assigns[:description]" %></p>
                  </div>
              </li>
          </ol>

          </div>
        </div>
      </div>
      <div class="col-12 col-md-6 col-lg-7 mx-auto">
        <div class="card shadow">
          <div class="card-body d-flex w-100  p-2">
            <p class="fs-4 mb-0 flex-1 pt-1 ps-2 pb-0" class="flex-1 m-0 p-0">
              Proveedores enlazados a este método
              <br/>
              <span class="text-muted">
              Proveedores del método
              </span>
            </p>
            <!--
            <%= live_patch to: assigns[:to_tab_actions] || "#", class: "btn flex-2" do %>
              <.icons_pencil_square />
            <% end %>
            -->
          </div>
          <div class="card-body w-100  p-2">
          <%= if length(assigns.list_a) > 0 do %>

            <.list let={entry} list={assigns.list_a}>
              <.item_list_title_actions to={entry.to} icon="true" class="ps-3">
                <:icon>
                  <.name_user text={entry.alias} />
                </:icon>
                <:title> <%= entry.name %></:title>
                <:subtitle> <code><%= entry.alias %></code>
                <p class="mb-0"><%= entry.description %></p>
                </:subtitle>
                <:actions>

                  </:actions>
              </.item_list_title_actions>
            </.list>
            <% else %>
              <div class="alert alert-info alert-dismissible fade show m-2 m-md-4 m-lg-3 pe-4" role="alert">
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                Lista de métodos vacia.
              </div>
            <% end %>
          </div>
        </div>
      </div>
    </div>
    """

  end

  def methods_list_index (assigns) do
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

                                <%= # <:options to={entry[:to_tab_rol]}> %>
                                <%= #   <.icons_person_badge class="me-2" /> %>
                                <%= #   <%= entry[:txt_index_actions_rol] %>
                                <%= # </:options> %>
                                <%= # <:options to={entry[:to_tab_actions]}> %>
                                <%= #   <.icons_people_fill class="me-2" /> %>
                                <%= #   <%= entry[:txt_index_actions_actions] %>
                                <%= # </:options> %>
                              </.dropdown>
                             </:actions>
                           </.item_list_title_actions>
                         </.list>
                         <% else %>
                           <div class="alert alert-info alert-dismissible fade show m-2 m-md-4 m-lg-5 pe-4" role="alert">
                             <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                             Lista de identidades vacia, utilice
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
         <div class="card rounded-3 border-success text-success">
           <div class="card-body p-1 d-flex ps-2">
             <.icons_signpost class="flex-2 mt-2 mxms-2 -e " width="64" height="64" />
             <div class="flex-1">
               <h3 class="m-0 text-success text-center"><%= assigns[:txt_count] || "[0]" %> </h3>
               <p class="m-0 text-muted fs-6 text-end">
                 <%= assigns[:txt_count_title] || "txt_count_title" %>
               </p>
             </div>
           </div>
         </div>
         <div class="card">
           <div class="card-body">
               <h4 class="header-title">Sistema de métodos </h4>
               <p class="sub-header">Administre en esta sección las <code>métodos</code> disponibles en este <code>servidor</code>. En cada método podrá ver los <code>los métodos de proveedores</code> y los detalles de cada <code>método</code>, con los cuales podrá acceder esta método en este <code>servidor</code>.
               </p>
           </div> <!-- end card-body -->
         </div>
       </div>
     </div>

    """
  end

  def methods_modal_delete (assigns) do
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




  def contexts_resume(assigns) do
    ~H"""
    <.resume_top_title {assigns} />

    <div class="row p-2 bg-white">

    <div class="col-12 col-md-6 col-lg-8 mx-auto">
      <div class="card shadow">
        <div class="card-body d-flex w-100 bg-primary p-2">
          <p class="fs-4 mb-0 flex-1 pt-1 ps-2 pb-0 text-white" class="flex-1 m-0 p-0">
            Detalle del contexto
            <br/>
            <span class="text-light">
            Contextos
            </span>
          </p>
          <!--
          <%= live_patch to: assigns[:to_tab_actions] || "#", class: "btn flex-2" do %>
            <.icons_pencil_square />
          <% end %>
          -->
        </div>
        <div class="card-body w-100  p-2">
          <ol class="list-group list-group-numbered shadow-lg">
            <li class="list-group-item d-flex justify-content-between align-items-start">
                <div class="ms-2 me-auto">
                    <div class="fw-bold">Tenant</div>
                    <code><%= assigns[:tenant_id] || "assigns[:tenant_id]" %></code>
                </div>
            </li>
            <li class="list-group-item d-flex justify-content-between align-items-start">
                <div class="ms-2 me-auto">
                    <div class="fw-bold">Nombre</div>
                    <%= assigns[:name] || "assigns[:name]" %>
                </div>
            </li>
            <li class="list-group-item d-flex justify-content-between align-items-start">
                <div class="ms-2 me-auto">
                    <div class="fw-bold">Atom</div>
                    <%= assigns[:atom] || "assigns[:atom]" %>
                </div>
            </li>
            <li class="list-group-item d-flex justify-content-between align-items-start">
                <div class="ms-2 me-auto">
                    <div class="fw-bold">Descripción</div>
                    <p class="border-white m-2 rounded shadow"><%= assigns[:description] || "assigns[:description]" %></p>
                </div>
            </li>
        </ol>

        </div>
      </div>
      </div>
    </div>
    """

  end

  def contexts_list_index (assigns) do
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
                              <.badges color="success">
                                <%= entry[:subtitle] %>
                              </.badges>
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

                                <%= # <:options to={entry[:to_tab_rol]}> %>
                                <%= #   <.icons_person_badge class="me-2" /> %>
                                <%= #   <%= entry[:txt_index_actions_rol] %>
                                <%= # </:options> %>
                                <%= # <:options to={entry[:to_tab_actions]}> %>
                                <%= #   <.icons_people_fill class="me-2" /> %>
                                <%= #   <%= entry[:txt_index_actions_actions] %>
                                <%= # </:options> %>
                              </.dropdown>
                             </:actions>
                           </.item_list_title_actions>
                         </.list>
                         <% else %>
                           <div class="alert alert-info alert-dismissible fade show m-2 m-md-4 m-lg-5 pe-4" role="alert">
                             <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                             Lista de identidades vacia, utilice
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
         <div class="card rounded-3 border-primary text-primary">
           <div class="card-body p-1 d-flex ps-2">
             <.icons_body_text class="flex-2 mt-2 mxms-2 -e " width="64" height="64" />
             <div class="flex-1">
               <h3 class="m-0 text-primary text-center"><%= assigns[:txt_count] || "[0]" %> </h3>
               <p class="m-0 text-muted fs-6 text-end">
                 <%= assigns[:txt_count_title] || "txt_count_title" %>
               </p>
             </div>
           </div>
         </div>
         <div class="card">
            <div class="card-body">
            <h4 class="header-title">Sistema de contextos </h4>
            <p class="sub-header">Administre en esta sección las <code>contextos</code> disponibles en este <code>servidor</code>. En cada contexto podrá ver los <code>los accesos</code> y <code>la cantidad de llaves</code> con los cuales podrá acceder esta contexto en este <code>servidor</code>.
            </p>
            </div> <!-- end card-body -->
         </div>
       </div>
     </div>

    """
  end

  @spec contexts_modal_delete(any) :: Phoenix.LiveView.Rendered.t()
  def contexts_modal_delete (assigns) do
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
