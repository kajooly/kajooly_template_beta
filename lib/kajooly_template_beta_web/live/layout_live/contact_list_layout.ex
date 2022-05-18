
defmodule KajoolyTemplateBetaWeb.LayoutLive.ContactListLayout do
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
  def contact_list_index_layout(assigns) do
    ~H"""


      <.resume_top_elemnts {assigns} />
          <div class="row">
          <!-- Right Sidebar -->
          <div class="col-12">
              <div class="card">
                  <div class="card-body">
                      <!-- Left sidebar -->
                      <div class="inbox-leftbar">

                          <div class="d-grid">
                                <%= live_patch to: assigns[:to_new], class: "btn btn-danger waves-effect waves-light" do %>

                                    <%= assigns[:to_new_title] || "to_new_title" %>
                                <% end %>
                          </div>

                          <div class="mail-list mt-4">
                              <a href="javascript: void(0);" class="text-danger"><i class="ri-inbox-fill align-bottom me-2"></i>Todos<span class="badge badge-soft-danger float-end ms-2">7</span></a>
                              <a href="javascript: void(0);"><i class="ri-star-line align-bottom me-2"></i>Favoritos</a>
                              <a href="javascript: void(0);"><i class="fas fa-globe-americas align-bottom me-2"></i>Público</a>
                              <a href="javascript: void(0);"><i class="fas fa-eye-slash align-bottom me-2"></i>Privado</a>
                              <a href="javascript: void(0);" class="text-muted fs-6"><i class=" fas fa-folder-plus me-2"></i>Agregar más listas</a>
                          </div>

                          <h6 class="mt-4">Etiquetas</h6>

                          <div class="list-group b-0 mail-list">
                                <a href="#" class="text-muted fs-6"><i class=" fas fa-tag me-2"></i>Agregar más etiqutas</a>

                          </div>

                          <!-- Modal -->
                          <div class="modal fade" id="composemodal" tabindex="-1" role="dialog" aria-labelledby="composemodalTitle" aria-hidden="true">
                              <div class="modal-dialog modal-dialog-centered" role="document">
                                  <div class="modal-content">
                                      <div class="modal-header">
                                          <h5 class="modal-title" id="composemodalTitle">New </h5>
                                          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                      </div>
                                      <div class="modal-body p-3">
                                          <form>
                                              <div class="mb-2">
                                                  <label for="messageto-input" class="form-label">To</label>
                                                  <input type="email" class="form-control" id="messageto-input" placeholder="Example@email.com">
                                              </div>

                                              <div class="mb-2">
                                                  <label for="subject-input" class="form-label">Subject</label>
                                                  <input type="text" class="form-control" id="subject-input" placeholder="Your subject">
                                              </div>

                                              <div class="mb-2">
                                                  <label for="subject-input" class="form-label">Message</label>
                                                  <div id="snow-editor" style="height: 200px;"></div> <!-- end Snow-editor-->
                                              </div>

                                          </form>
                                      </div>
                                      <div class="modal-footer">
                                          <button type="button" class="btn btn-light" data-bs-dismiss="modal">Close</button>
                                          <button type="button" class="btn btn-primary">Send <i class="fab fa-telegram-plane ms-1"></i></button>
                                      </div>
                                  </div>
                              </div>
                          </div>

                      </div>
                      <!-- End Left sidebar -->

                      <div class="inbox-rightbar">
                        <div class="w-100 d-flex">
                          <div class="flex-1 input-group me-1">
                            <input type="text" class="form-control border-light" placeholder="Buscar en contactos" aria-label="Buscar en contactos" aria-describedby="button-addon2">
                            <button class="btn btn-sm btn-light waves-effect" type="button" id="button-addon2">Buscar</button>
                          </div>
                          <div class="flex-2 btn-group me-1">
                              <button type="button" class="btn btn-sm btn-light dropdown-toggle waves-effect" data-bs-toggle="dropdown" aria-expanded="false">
                                  <i class="mdi mdi-folder font-18"></i>
                                  <i class="mdi mdi-chevron-down"></i>
                              </button>
                              <div class="dropdown-menu">
                                  <span class="dropdown-header">Mover a</span>
                                  <a class="dropdown-item" href="javascript: void(0);">Social</a>
                                  <a class="dropdown-item" href="javascript: void(0);">Promotions</a>
                                  <a class="dropdown-item" href="javascript: void(0);">Updates</a>
                                  <a class="dropdown-item" href="javascript: void(0);">Forums</a>
                              </div>
                          </div>
                          <div class="flex-2 btn-group me-1">
                              <button type="button" class="btn btn-sm btn-light dropdown-toggle waves-effect" data-bs-toggle="dropdown" aria-expanded="false">
                                  <i class="mdi mdi-label font-18"></i>
                                  <i class="mdi mdi-chevron-down"></i>
                              </button>
                              <div class="dropdown-menu">
                                  <span class="dropdown-header">Etiqueta:</span>
                                  <a class="dropdown-item" href="javascript: void(0);">Updates</a>
                                  <a class="dropdown-item" href="javascript: void(0);">Social</a>
                                  <a class="dropdown-item" href="javascript: void(0);">Promotions</a>
                                  <a class="dropdown-item" href="javascript: void(0);">Forums</a>
                              </div>
                          </div>

                          <div class="flex-2 btn-group me-1">
                              <button type="button" class="btn btn-sm btn-light dropdown-toggle waves-effect" data-bs-toggle="dropdown" aria-expanded="false">
                                  <i class="mdi mdi-dots-horizontal font-18"></i>
                                  <i class="mdi mdi-chevron-down"></i>
                              </button>
                              <div class="dropdown-menu">
                                  <span class="dropdown-header">More Option :</span>
                                  <a class="dropdown-item" href="javascript: void(0);">Add Star</a>
                                  <a class="dropdown-item" href="javascript: void(0);">Mute</a>
                              </div>
                          </div>
                        </div>

                          <div class="mt-3">
                              <ul class="message-list">

                                <%= for item <- assigns.list  do %>

                                  <li class="unread">
                                      <div class="col-mail col-mail-1">
                                          <div class="checkbox-wrapper-mail">
                                              <input type="checkbox" id="chk1">
                                              <label for="chk1" class="toggle"></label>
                                          </div>
                                          <span class="star-toggle far fa-star text-warning"></span>
                                          <a href="" class="title"><%= item[:title] %></a>
                                      </div>
                                      <div class="col-mail col-mail-2">
                                          <a href="" class="subject"><%= item[:subtitle] %>
                                          </a>
                                          <div class="date"><%= item[:date] %></div>
                                      </div>
                                  </li>
                                  <%  end %>
                              </ul>
                          </div>
                          <!-- end .mt-4 -->

                          <div class="row d-none">
                              <div class="col-7 mt-1">
                                  Showing 1 - 20 of 289
                              </div> <!-- end col-->
                              <div class="col-5">
                                  <div class="btn-group float-end">
                                      <button type="button" class="btn btn-light btn-sm"><i class="mdi mdi-chevron-left"></i></button>
                                      <button type="button" class="btn btn-info btn-sm"><i class="mdi mdi-chevron-right"></i></button>
                                  </div>
                              </div> <!-- end col-->
                          </div>
                          <!-- end row-->
                      </div>
                      <!-- end inbox-rightbar-->

                      <div class="clearfix"></div>
                  </div>
              </div> <!-- end card-box -->

          </div> <!-- end Col -->
          </div><!-- End row -->

    """

  end

end
