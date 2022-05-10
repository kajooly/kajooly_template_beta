defmodule KajoolyTemplateBetaWeb.GenericLive.Chat do
  import Phoenix.LiveView
  import Phoenix.LiveView.Helpers
  import KajoolyTemplateBetaWeb.GenericLive.Icons

  @doc """

  Chat

  Live Controler code:

    import KajoolyTemplateBetaWeb.GenericLive.Chat


  ## Examples

      <.chat color="alert">
          chat title
      </.chat>


  """
  def chat(assigns) do
    ~H"""
          <div class="card">

            <div class="card-body p-0">
                <ul class="conversation-list chat-app-conversation p-2" data-simplebar style="max-height: 460px">
                    <li class="clearfix">
                        <div class="chat-avatar">
                            <.name_user text="Jamx Z" class="rounded" alt="James Z" />
                            <i>10:00</i>
                        </div>
                        <div class="conversation-text">
                            <div class="ctext-wrap">
                                <i>James Zavel</i>
                                <p>
                                    Hello!
                                </p>
                            </div>
                        </div>
                        <div class="conversation-actions dropdown">
                            <button class="btn btn-sm btn-link text-reset" data-bs-toggle="dropdown"
                                aria-expanded="false"><i class='mdi mdi-dots-vertical font-18'></i></button>

                            <div class="dropdown-menu dropdown-menu-end">
                                <a class="dropdown-item" href="#">Editar</a>
                                <a class="dropdown-item" href="#">Eliminar</a>
                            </div>
                        </div>
                    </li>
                    <li class="clearfix odd">
                        <div class="chat-avatar">
                            <.name_user text="Nik Patel" class="rounded" alt="Nik Patel" />
                            <i>10:01</i>
                        </div>
                        <div class="conversation-text">
                            <div class="ctext-wrap">
                                <i>Nik Patel</i>
                                <p>

                                  Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.

                                </p>
                            </div>
                        </div>
                        <div class="conversation-actions dropdown">
                            <button class="btn btn-sm btn-link text-reset" data-bs-toggle="dropdown"
                                aria-expanded="false"><i class='mdi mdi-dots-vertical font-18'></i></button>

                            <div class="dropdown-menu">
                                <a class="dropdown-item" href="#">Editar</a>
                                <a class="dropdown-item" href="#">Eliminar</a>
                            </div>
                        </div>
                    </li>
                    <li class="clearfix odd">
                      <div class="chat-avatar">
                           <.name_user text="Nik Patel" class="rounded" alt="Nik Patel" />
                          <i>10:05</i>
                      </div>
                      <div class="conversation-text">
                          <div class="ctext-wrap">
                              <i>Nik Patel</i>
                              <p>

                                Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.

                              </p>
                          </div>
                          <div class="card mt-2 mb-1 shadow-none border text-start">
                              <div class="p-2">
                                  <div class="row align-items-center">
                                      <div class="col-auto">
                                          <div class="avatar-sm">
                                              <span class="avatar-title bg-primary rounded">
                                                  PDF
                                              </span>
                                          </div>
                                      </div>
                                      <div class="col ps-0">
                                          <a href="javascript:void(0);"
                                              class="text-muted fw-medium">presentation.pdf</a>
                                          <p class="mb-0">2.3 MB</p>
                                      </div>
                                      <div class="col-auto">
                                          <!-- Button -->
                                          <a href="javascript:void(0);"
                                              class="btn btn-link btn-lg text-muted">
                                              <i class="ri-download-fill"></i>
                                          </a>
                                      </div>
                                  </div>
                              </div>
                          </div>
                      </div>
                      <div class="conversation-actions dropdown">
                          <button class="btn btn-sm btn-link text-reset" data-bs-toggle="dropdown"
                              aria-expanded="false"><i class='mdi mdi-dots-vertical font-18'></i></button>

                          <div class="dropdown-menu">
                              <a class="dropdown-item" href="#">Editar</a>
                              <a class="dropdown-item" href="#">Borrar</a>
                          </div>
                      </div>
                  </li>


                </ul>

                <div class="row">
                    <div class="col">
                        <div class="mt-2 bg-light p-3 rounded">
                            <form class="needs-validation" novalidate="" name="chat-form"
                                id="chat-form">
                                <div class="row">
                                    <div class="col mb-2 mb-sm-0">
                                        <input type="text" class="form-control border-0" placeholder="E scribe tu mensaje" required="">
                                        <div class="invalid-feedback mt-2 mb-0">
                                            Por favor escribe tu mensaje
                                        </div>
                                    </div>
                                    <div class="col-sm-auto">
                                        <div class="btn-group">
                                            <a href="#" class="btn btn-light"><i class="fe-paperclip"></i></a>
                                            <div class="d-grid">
                                                <button type="submit" class="btn btn-success chat-send"><i class='fe-send'></i></button>
                                            </div>
                                        </div>
                                    </div> <!-- end col -->
                                </div> <!-- end row-->
                            </form>
                        </div>
                    </div> <!-- end col-->
                </div>
                <!-- end row -->
            </div> <!-- end card-body -->
        </div> <!-- end card -->


    """
  end

end
