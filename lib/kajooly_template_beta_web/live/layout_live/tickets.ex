
defmodule KajoolyTemplateBetaWeb.LayoutLive.TicketsLayout do
  import Phoenix.LiveView
  import Phoenix.LiveView.Helpers
  import KajoolyTemplateBetaWeb.GenericLive.Breadcrum
  import KajoolyTemplateBetaWeb.GenericLive.Icons
  import KajoolyTemplateBetaWeb.GenericLive.Dropdown
  import KajoolyTemplateBetaWeb.LayoutLive.ResumeTop
  import KajoolyTemplateBetaWeb.GenericLive.Tabs
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
      <.resume_top_elemnts {assigns}>
        <:cards title={assigns[:txt_total_ticket] ||  "txt_total_ticket"}  subtitle="Total de tickets" color="dark">
          <.icons_ticket_detailed class="flex-2 mt-2 mxms-2 -e " width="64" height="64" />
        </:cards>
        <:cards title={assigns[:txt_pending_ticket] ||  "txt_pending_ticket"}  subtitle="Tickets pendietnes" color="warning">
          <.icons_archive class="flex-2 mt-2 mxms-2 -e " width="64" height="64" />
        </:cards>
        <:cards title={assigns[:txt_closed_ticket] ||  "txt_closed_ticket"} subtitle="Tickets cerrados" color="success">
          <.icons_check_circle class="flex-2 mt-2 mxms-2 -e " width="64" height="64" />
        </:cards>
      </.resume_top_elemnts>

      <.tab_select tab={assigns[:tabs]}>
      </.tab_select>
      <div class="row bg-white">
        <div class="col-12 my-2">
          <div class=" d-flex">
            <div class="flex-1 px-4">
              <%= render_slot(@search) %>
            </div>
            <%= live_patch to: assigns[:to_new] || "#to_new", class: "btn btn-outline-success flex-2" do %>
              <%= assigns[:to_new_title] || "to_new_title" %>
            <% end %>
          </div>
        </div>
      </div>
      <div class="row bg-white">
        <div class="col-12">
          <div class="card">
            <div class="card-body p-0 shadow">
              <table class="table table-hover m-0 table-centered dt-responsive nowrap w-100" cellspacing="0" id="tickets-table">
                <thead class="bg-light">
                <tr>
                  <%= for th <- assigns[:titles] || [] do %>
                    <th class={"fw-medium col-d-#{th[:show]}"}><%= th[:title] %></th>
                  <% end %>
                </tr>
                </thead>
                <tbody class="font-14">
                  <%= for item <- assigns[:list] || [] do %>
                    <tr>
                      <td>
                        <%= live_patch to: item[:to] do %>
                          <b><%= item[:hash_id] || "hash_id" %></b>
                         <% end %>
                      </td>
                      <td>
                        <%= live_patch to: item[:to_requested_by] do %>
                          <.name_user text={item[:requested_by]} />
                          <span class="ms-2">
                            <%= item[:requested_by] || "requested_by" %>
                          </span>
                        <% end %>

                      </td>
                      <td>

                        <%= live_patch to: item[:to] do %>
                         <%= item[:subject] || "subject" %>
                        <% end %>
                      </td>
                      <td>
                        <%= live_patch to: item[:to_assignee] do %>
                          <.name_user text={item[:assignee]} />
                        <% end %>

                      </td>

                      <td>
                          <span class={"badge bg-#{item[:priority_color] || "secondary text-light"} "}>
                          <%= item[:priority] || "priority" %>
                          </span>
                      </td>

                      <td>
                          <span class={"badge bg-#{item[:status_color] || "success"}"}>
                            <%= item[:status] || "status" %>
                          </span>
                      </td>

                      <td>
                        <%= item[:created_date] || "created_date" %>
                      </td>

                      <td>
                        <%= item[:due_date] || "due_date" %>
                      </td>

                      <td>
                        <%= if item[:actions] > 0 do %>
                          <div class="btn-group dropdown">
                            <a href="#" class="dropdown-toggle arrow-none btn btn-light btn-sm" data-bs-toggle="dropdown" aria-expanded="false"><i class="mdi mdi-dots-horizontal"></i></a>
                            <div class="dropdown-menu dropdown-menu-end">
                              <%= for action <- item[:actions] do %>
                                <%= live_patch to: action[:to], class: "dropdown-item" do %>
                                  <i class={action[:icon]}></i>
                                  <%=  action[:title] %>
                                <% end %>
                              <% end %>
                            </div>
                          </div>
                        <% end %>
                      </td>
                    </tr>
                  <% end %>


                </tbody>
              </table>
            </div>
          </div>
        </div><!-- end col -->
      </div>
    <!-- end row -->

    """
  end


  @doc """


  ## Examples

  <.ticket_details
  color="alert"

  >
  </.ticket_details>


    """
    def ticket_details(assigns) do
    ~H"""
      <.resume_top_elemnts {assigns}>
      </.resume_top_elemnts>

      <.tab_select>
        <:tab to="#" selected="true">Detalles</:tab>
        <:tab to="#">Logica de negoció</:tab>
      </.tab_select>
      <div class="row bg-white pt-2">
        <div class="col-xl-8">
            <div class="card">
                <div class="card-body px-2 pt-3">
                    <div class="dropdown float-end">
                        <a href="#" class="dropdown-toggle arrow-none text-muted" data-bs-toggle="dropdown" aria-expanded="false">
                            <i class='mdi mdi-dots-horizontal font-18'></i>
                        </a>
                        <div class="dropdown-menu dropdown-menu-end">
                          <%= for item <- assigns[:options] do %>
                            <%= live_patch to: item[:to], class: " dropdown-item #{item[:class]}" do %>
                              <i class={item[:icon]}></i>
                            <%= item[:title] %>
                            <% end %>
                          <% end %>
                        </div>
                    </div>
                    <p class="text-primary"><%= assigns[:hash_id] %></p>
                    <h4 class="mb-1"> <%= assigns[:resume][:title] %></h4>
                    <p class="text-muted mb-1"><%= assigns[:resume][:subtitle] %></p>
                    <div class="text-muted">
                        <div class="row">
                            <div class="col-lg-4 col-sm-6">
                                <div class="d-flex align-items-start mt-3">
                                    <div class="me-2 align-self-center">
                                        <i class="ri-hashtag h2 m-0 text-muted"></i>
                                    </div>
                                    <div class="flex-1 overflow-hidden">
                                        <p class="mb-1"><%= assigns[:resume][:title_id] %></p>
                                        <h5 class="mt-0 text-truncate">
                                            <%= assigns[:resume][:hash_id] %>
                                        </h5>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4 col-sm-6">
                                <div class="d-flex align-items-start mt-3">
                                    <div class="me-2 align-self-center">
                                      <.name_user text={assigns[:resume][:name_assign]} />
                                    </div>
                                    <div class="flex-1 overflow-hidden">
                                        <p class="mb-1"><%= assigns[:resume][:title_assign] %></p>
                                        <h5 class="mt-0 text-truncate">
                                        <%= assigns[:resume][:name_assign] %>
                                        </h5>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4 col-sm-6">
                                <div class="d-flex align-items-start mt-3">
                                    <div class="me-2 align-self-center">
                                        <i class="ri-calendar-event-line h2 m-0 text-muted"></i>
                                    </div>
                                    <div class="flex-1 overflow-hidden">
                                      <p class="mb-1"><%= assigns[:resume][:title_date] %></p>
                                      <h5 class="mt-0 text-truncate">
                                      <%= assigns[:resume][:date] %>
                                      </h5>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="mt-4">
                      <div>
                        <h5> <%= assigns[:resume][:title_description] %> :</h5>
                        <p class="text-muted">
                          <%= assigns[:resume][:description] %>
                        </p>
                        <div class="mt-3">
                          <h5><%= assigns[:resume][:title_tags] %> :</h5>
                          <div>
                          <%= for tag <- assigns[:resume][:tags] do %>
                            <%= live_patch tag[:tilte] || "#title", to: tag[:to], class: "badge badge-soft-#{tag[:color] || "primary"} p-1 m-1 #{tag[:class]}" %>
                            <% end %>
                          </div>
                        </div>
                      </div>

                      <div class="mt-4">
                      <h5 class="d-flex"><span class="flex-1"><%= assigns[:resume][:title_checklists] %> </span> <button class="btn btn-sm btn-success">+ Añadir lista de tareas</button></h5>
                      </div>
                      <%= for tag <- assigns[:resume][:checklists] do %>

                        <div class="mt-4">
                          <h5><%= tag[:title] %></h5>

                          <%= for item <- tag[:list] do %>

                            <div class="form-check mt-1">
                                <input class="form-check-input" type="checkbox" id="checklistcheck01"
                                checked={ if item[:checked] == "true" do "checked" else "false" end } />
                                <label class="form-check-label strikethrough" for="checklistcheck01">
                                <%= item[:title] %>
                                </label>
                            </div>
                            <% end %>
                          <!-- end sub tasks/checklists -->
                        </div>
                      <% end %>

                    </div>
                </div>
            </div>

            <div class="card d-none">
                <div class="card-body p-2">
                    <div class="dropdown float-end">
                        <a href="#" class="dropdown-toggle arrow-none text-muted"
                            data-bs-toggle="dropdown" aria-expanded="false">
                            <i class='mdi mdi-dots-horizontal font-18'></i>
                        </a>
                        <div class="dropdown-menu dropdown-menu-end">
                            <!-- item-->
                            <a href="javascript:void(0);" class="dropdown-item">
                                <i class='mdi mdi-attachment me-1'></i>Attachment
                            </a>
                            <!-- item-->
                            <a href="javascript:void(0);" class="dropdown-item">
                                <i class='mdi mdi-pencil-outline me-1'></i>Edit
                            </a>
                            <!-- item-->
                            <a href="javascript:void(0);" class="dropdown-item">
                                <i class='mdi mdi-content-copy me-1'></i>Mark as Duplicate
                            </a>
                            <div class="dropdown-divider"></div>
                            <!-- item-->
                            <a href="javascript:void(0);" class="dropdown-item text-danger">
                                <i class='mdi mdi-delete-outline me-1'></i>Delete
                            </a>
                        </div> <!-- end dropdown menu-->
                    </div> <!-- end dropdown-->
                    <h5 class="header-title mb-3">Attachments</h5>

                    <div class="row">
                        <div class="col-md-6">
                            <div>
                                <form action="/" method="post" class="dropzone" id="myAwesomeDropzone" data-plugin="dropzone" data-previews-container="#file-previews"
                                    data-upload-preview-template="#uploadPreviewTemplate">
                                    <div class="fallback">
                                        <input name="file" type="file" />
                                    </div>

                                    <div class="dz-message needsclick">
                                        <i class="h2 text-muted ri-upload-2-line d-inline-block"></i>
                                        <h4>Drop files here or click to upload.</h4>
                                    </div>
                                </form>
                            </div>
                        </div>

                        <div class="col-sm-6">
                            <div class="mt-4 mt-md-0">
                                <div class="card border mb-2">
                                    <div class="p-2">
                                        <div class="row align-items-center">
                                            <div class="col-auto">
                                                <div class="avatar-sm">
                                                    <span class="avatar-title badge-soft-primary text-primary rounded">
                                                        ZIP
                                                    </span>
                                                </div>
                                            </div>
                                            <div class="col ps-0">
                                                <a href="javascript:void(0);" class="text-muted fw-semibold">Minton-sketch-design.zip</a>
                                                <p class="mb-0 font-12">2.3 MB</p>
                                            </div>
                                            <div class="col-auto">
                                                <!-- Button -->
                                                <a href="javascript:void(0);" class="btn btn-link font-16 text-muted">
                                                    <i class="ri-download-2-line"></i>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="card border mb-0">
                                    <div class="p-2">
                                        <div class="row align-items-center">
                                            <div class="col-auto">
                                                <div class="avatar-sm">
                                                    <span class="avatar-title bg-secondary rounded text-light">
                                                        .MP4
                                                    </span>
                                                </div>
                                            </div>
                                            <div class="col ps-0">
                                                <a href="javascript:void(0);" class="text-muted fw-semibold">Admin-bug-report.mp4</a>
                                                <p class="mb-0 font-12">7.05 MB</p>
                                            </div>
                                            <div class="col-auto">
                                                <!-- Button -->
                                                <a href="javascript:void(0);" class="btn btn-link font-16 text-muted">
                                                    <i class="ri-download-2-line"></i>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <!-- Preview -->
                                <div class="dropzone-previews mt-2" id="file-previews"></div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-xl-4">
            <div class="card">
                <div class="card-body px-2 pt-3">
                    <.dropdown
                      class="float-end"
                      class_button="btn-sm float-end ms-2 btn-outline-secondary"
                      class_dropdown=""
                      options={assigns[:resume][:filters_comments]}
                    >
                      <%= assigns[:resume][:title_filters_comments] %>
                      <.icons_caret_down_fill class="float-end pt-1 ms-1" />
                    </.dropdown>
                    <!-- end dropdown-->

                    <h4 class="mb-4 mt-0 font-16">
                      <%= assigns[:resume][:title_comments] %>
                    </h4>

                    <div class="clerfix"></div>


                    <%= for item <- assigns[:resume][:commnents]  do %>

                      <div class="d-flex align-items-start mt-3">
                        <.name_user text="BK" class="me-2" />
                          <div class="flex-1">
                              <h5 class="mt-0"> <%= item[:user] %> <small class="text-muted fw-normal float-end"> <%= item[:date] %> </small></h5>
                              <%= item[:text] %>

                          </div>
                    </div>
                    <% end %>

                    <div class="text-center mt-2">
                        <a href="javascript:void(0);" class="text-danger"><i class="mdi mdi-spin mdi-loading me-1"></i> Cargar más...</a>
                    </div>

                    <div class="border rounded mt-4">
                        <form action="#" class="comment-area-box">
                            <textarea rows="3" class="form-control border-0 resize-none" placeholder="Escribe un comentario..."></textarea>
                            <div class="p-2 bg-light d-flex justify-content-between align-items-center">
                                <div>
                                    <a href="#" class="btn btn-sm px-1 btn-light"><i class='mdi mdi-upload'></i></a>
                                    <a href="#" class="btn btn-sm px-1 btn-light"><i class='mdi mdi-at'></i></a>
                                </div>
                                <button type="submit" class="btn btn-sm btn-success"><i class="fe-send me-1"></i>Enviar</button>
                            </div>
                        </form>
                    </div> <!-- end .border-->

                </div> <!-- end card-body-->
            </div>
            <!-- end card-->
        </div>
    </div>
    <!-- end row -->

    """
    end

end
