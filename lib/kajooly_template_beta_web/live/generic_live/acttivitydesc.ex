defmodule KajoolyTemplateBetaWeb.GenericLive.Activitydesc do
  import Phoenix.LiveView
  import Phoenix.LiveView.Helpers
  @doc """

  Dropdown

  Live Controler code:

    import KajoolyTemplateBetaWeb.GenericLive.Activitydesc

  ## Examples

      <!-- Simple -->
      <.activitydesc text="">
      </.activitydesc>


  """

  def activitydesc (assigns) do
    text=assigns[:text] || "Sin Descripcion"
    ~H"""
      <div>
        <h6 class="text-secondary fs-5">
          Descripción del comentario
        </h6>
      </div>
      <div>
        <h6 class="text-secondary fs-5">
          <%= text %>
        </h6>
      </div>
      <div class="text-center">
        <button type="button" class="btn btn btn-light" > <span class="text-primary">Ver mas</span></button>
      </div>
    """
  end
end
