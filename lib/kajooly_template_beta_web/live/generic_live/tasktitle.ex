defmodule KajoolyTemplateBetaWeb.GenericLive.Tasktitle do
  import Phoenix.LiveView
  import Phoenix.LiveView.Helpers

  @doc """

  Dropdown

  Live Controler code:

    import KajoolyTemplateBetaWeb.GenericLive.Tasktitle

  ## Examples

      <!-- Simple -->
        <.tasktitle>
        </.tasktitle>

  ====================================
        <.tasktitle title="example" date="example name="example">
          <:asignaciones to="#algo1">
          Urgente
          </:asignaciones>
          <:asignaciones to="#algo2" selected="true">
            Asignación
          </:asignaciones>
          <:asignaciones to="#algo3">
            Urgente
          </:asignaciones>
          <:asignaciones to="#algo4">
            Otro...
          </:asignaciones>
        </.tasktitle>
 ====================================
        <.tasktitle title="example" date="example name="example">
        </.tasktitle>

  """

  def tasktitle (assigns) do
    title=assigns[:title] || "Sin Titulo"
    date=assigns[:date] || "Sin Fecha"
    name=assigns[:name] || "Sin solic"
    ~H"""
      <div class="card border-start">
        <div class="card-body">
          <div class="row">
            <div class="col-12 d-flex justify-content-between">
              <div class="text-start">
                <h5 class="card-title"><%= title %></h5>
              </div>
              <div class="text-end">
                <p class="card-text text-end"><%= date %></p>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-12 d-flex justify-content-between">
              <div class="text-start align-items-center">
                <h6 class="card-title pt-2"><%= name %></h6>
              </div>
              <div class="text-end">
                <div class="dropdown">
                  <button type="button" class="btn btn-primary btn-sm" id="dropdownMenuButtonAsignacion" data-bs-toggle="dropdown" aria-expanded="false">
                    Asignación
                  </button>
                  <ul class="dropdown-menu" aria-labelledby="dropdownMenuButtonAsignacion">
                    <%= for option  <- @asignaciones  do %>
                      <li>
                        <%= live_patch to: option[:to], class: "dropdown-item  #{ if option[:selected] == "true" do "active" end }" do %>
                          <%= render_slot(  option ) %>
                        <%  end %>
                      </li>
                    <%  end %>
                  </ul>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    """
  end
end
