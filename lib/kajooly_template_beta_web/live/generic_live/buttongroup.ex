defmodule KajoolyTemplateBetaWeb.GenericLive.Buttongroup2 do
  import Phoenix.LiveView
  import Phoenix.LiveView.Helpers
  import KajoolyTemplateBetaWeb.GenericLive.Icons
  import KajoolyTemplateBetaWeb.GenericLive.Dropdownrounded

  @doc """

  Dropdown

  Live Controler code:

    import KajoolyTemplateBetaWeb.GenericLive.Buttongroup2

  ## Examples

      <!-- Simple -->
      <.buttongroup update="11/11/22">
        <:cards to="#algo1">
          Juan Alberto P.
        </:cards>
      </.buttongroup>

  """

  def buttongroup (assigns) do
    number=assigns[:number] || "3"
    update=assigns[:update] || "--"
    ~H"""
    <h6 class="px-2 text-secondary fs-5">Asignación</h6>
    <div class="dropdown">
      <div class="btn-group" role="group" aria-label="Basic example">
        <button type="button" class="btn btn-link bg-none border-0 rounded-circle px-0" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
          <.name_user text="BK" />
        </button>
        <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
            <%= for card  <- @cards  do %>
              <li>
                <div class='card'>
                  <div class="card-title">
                    <%= live_patch to: card[:to], class: "dropdown-item  #{ if card[:selected] == "true" do "active" end }" do %>
                      <%= render_slot(  card ) %>
                    <%  end %>
                  </div>
                  <div class="card-body">
                    <p>Cuerpo del card M</p>
                  </div>
                </div>
              </li>
            <%  end %>
        </ul>

        <button type="button" class="btn btn-link bg-none border-0 rounded-circle px-0" id="dropdownMenuButton2" data-bs-toggle="dropdown" aria-expanded="false">
          <.name_user text="TU" />
        </button>
        <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton2">
          <%= for card  <- @cards  do %>
            <li>
              <div class='card'>
                <div class="card-title">
                  <%= live_patch to: card[:to], class: "dropdown-item  #{ if card[:selected] == "true" do "active" end }" do %>
                    <%= render_slot(  card ) %>
                  <%  end %>
                </div>
                <div class="card-body">
                  <p>Cuerpo del card</p>
                </div>
              </div>
            </li>
          <%  end %>
        </ul>

        <button type="button" class="btn btn-link bg-none border-0 rounded-circle px-0" id="dropdownMenuButton3" data-bs-toggle="dropdown" aria-expanded="false">
          <.name_user text="DP" />
        </button>
        <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton3">
          <%= for card  <- @cards  do %>
            <li>
              <div class='card'>
                <div class="card-title">
                  <%= live_patch to: card[:to], class: "dropdown-item  #{ if card[:selected] == "true" do "active" end }" do %>
                    <%= render_slot(  card ) %>
                  <%  end %>
                </div>
                <div class="card-body">
                  <p>Cuerpo del card D</p>
                </div>
              </div>
            </li>
          <% end %>
        </ul>

        <.dropdownrounded>
          <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chevron-down" viewBox="0 0 16 16">
            <path fill-rule="evenodd" d="M1.646 4.646a.5.5 0 0 1 .708 0L8 10.293l5.646-5.647a.5.5 0 0 1 .708.708l-6 6a.5.5 0 0 1-.708 0l-6-6a.5.5 0 0 1 0-.708z"/>
          </svg>
          <:options to="#algo1">
            Jose Valim
          </:options>
          <:options to="#algo2" selected="true">
            Mark Z.
          </:options>
          <:options to="#algo3">
            Agregar usuario
          </:options>
        </.dropdownrounded>

      </div>
    </div>
    <h6 class="text-end text-secondary fs-5">Ultima actualización: <%= update %>  </h6>
    """
  end
end
