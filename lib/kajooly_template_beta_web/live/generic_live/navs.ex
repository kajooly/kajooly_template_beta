defmodule KajoolyTemplateBetaWeb.GenericLive.Navs do
  import Phoenix.LiveView
  import Phoenix.LiveView.Helpers

  import KajoolyTemplateBetaWeb.GenericLive.Comment
  @doc """

  Dropdown

  Live Controler code:

    import KajoolyTemplateBetaWeb.GenericLive.Navs

  ## Examples

      <!-- Simple -->
      <.navs>
      </.navs>

  """

  def navs (assigns) do
    ~H"""
      <ul class="nav nav-tabs w-100" role="tablist">
        <li class="nav-item" role="presentation">
          <a
            class="nav-link active"
            id="ex1-tab-1"
            data-mdb-toggle="tab"
            href="#tabs-1"
            role="tab"
            aria-controls="tabs-1"
            aria-selected="true"
            >Actividades</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" id="ex1-tab-2" data-mdb-toggle="tab" href="#ex1-tabs-2" role="tab" aria-controls="ex1-tabs-2" aria-selected="false">Comentarios</a>
        </li>
        <li class="nav-item">
        <a class="nav-link" id="ex1-tab-3" data-mdb-toggle="tab" href="#ex1-tabs-3" role="tab" aria-controls="ex1-tabs-3" aria-selected="false">Archivos</a>
        </li>
      </ul>

      <div class="tab-content">
        <div
          class="tab-pane active"
          id="tabs-1"
          role="tabpanel"
          aria-labelledby="tab-1"
        >
            <.comment>
            </.comment>
        </div>
        <div class="tab-pane fade" id="ex1-tabs-2" role="tabpanel" aria-labelledby="ex1-tab-2">
            <.comment>
            </.comment>
        </div>
        <div class="tab-pane fade" id="ex1-tabs-3" role="tabpanel" aria-labelledby="ex1-tab-3">
            <.comment>
            </.comment>
        </div>
      </div>
    """
  end
end
