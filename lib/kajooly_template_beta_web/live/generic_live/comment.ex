defmodule KajoolyTemplateBetaWeb.GenericLive.Comment do
  import Phoenix.LiveView
  import Phoenix.LiveView.Helpers
  @doc """

  Dropdown

  Live Controler code:

    import KajoolyTemplateBetaWeb.GenericLive.Comment

  ## Examples

      <!-- Simple -->
      <.comment>
      </.comment>

      <.comment name="Example" date="11/11/21" comment="Example comment" >
      </.comment>

  """

  def comment (assigns) do
    name=assigns[:name] || "Sin Nombre"
    date=assigns[:date] || "Sin Fecha"
    comment=assigns[:comment] || "Sin Comentario"
    ~H"""
    <div class="d-flex">
      <div class="container">
        <div class="row">
          <div class="col-12 d-flex justify-content-between">
            <div class="text-start">
              <h5 class="card-title"><%= name %></h5>
            </div>
            <div class="text-end">
              <p class="card-text text-end fs-5 text-secondary"><%= date %></p>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-12">
            <h6 class="text-secondary"><%= comment %></h6>
          </div>
        </div>
      </div>
    </div>
    """
  end
end
