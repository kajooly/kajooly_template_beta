defmodule KajoolyTemplateBetaWeb.GenericLive.Treeviewbasic do
  import Phoenix.LiveView
  import Phoenix.LiveView.Helpers

  import KajoolyTemplateBetaWeb.GenericLive.Breadcrum

   @doc """

  Treeviewbasic

  Live Controler code:

    import KajoolyTemplateBetaWeb.GenericLive.Treeviewbasic

  ## Examples

      <!-- Simple -->
      <.treeviewbasic>
      </.treeviewbasic>

      <.treeviewbasic name="Example name">
      </.treeviewbasic>

  """

  def treeviewbasic (assigns) do
    name=assigns[:name] || "Sin Nombre"
    get_list=assigns[:get_list] || ""
    ~H"""
    <.breadcrum pages={assigns[:breadcrum]}>
      Treeview Basic
    </.breadcrum>
    <div class="row">
      <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12">
          <div class="card">
              <div class="card-body">
                  <h4 class="header-title mb-3"> <%= name %></h4>

                  <div id="basicTree">
                    <ul>
                        <li><b>MINTON</b>
                            <ul>

                              <li data-jstree='{"opened":true}'>Assets
                                  <ul>
                                    <li data-jstree='{"type":"file"}'>Css</li>
                                    <li data-jstree='{"opened":true}'>Plugins
                                        <ul>
                                            <li data-jstree='{"selected":true,"type":"file"}'>Plugin one</li>
                                            <li data-jstree='{"type":"file"}'>Plugin two</li>
                                        </ul>
                                    </li>
                                  </ul>
                              </li>
                              <li data-jstree='{"opened":true}'>Email Template
                                  <ul>
                                      <li data-jstree='{"type":"file"}'>Email one</li>
                                      <li data-jstree='{"type":"file"}'>Email two</li>
                                  </ul>
                              </li>
                              <li data-jstree='{"icon":"mdi mdi-view-dashboard"}'>Dashboard</li>
                              <li data-jstree='{"icon":"mdi mdi-format-font"}'>Typography</li>
                              <li data-jstree='{"opened":true}'>User Interface
                                <ul>
                                    <li data-jstree='{"type":"file"}'>Buttons</li>
                                    <li data-jstree='{"type":"file"}'>Cards</li>
                                </ul>
                              </li>
                              <li data-jstree='{"icon":"mdi mdi-texture"}'>Forms</li>
                              <li data-jstree='{"icon":"mdi mdi-view-list"}'>Tables</li>
                            </ul>
                        </li>
                      <li data-jstree='{"type":"file"}'>Frontend</li>
                    </ul>
                  </div>
              </div>
          </div> <!-- end card -->
      </div> <!-- end col-->
    </div> <!-- end row -->

    """
  end

end
