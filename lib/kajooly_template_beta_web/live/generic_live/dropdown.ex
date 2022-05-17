defmodule KajoolyTemplateBetaWeb.GenericLive.Dropdown do
  import Phoenix.LiveView
  import Phoenix.LiveView.Helpers

  use Phoenix.LiveComponent
  @doc """

  Dropdown

  Live Controler code:

    import KajoolyTemplateBetaWeb.GenericLive.Dropdown

  ## Examples

      <!-- Simple -->


      <.dropdown options={[
          %{
            title: "Reciente",
            selected: "true",
            to: "#"
          },
          %{
            title: "Más Antiguo",
            to: "#"
          },
          %{
            title: "Más reciente",
            to: "#"
          },
        ]}>
        Título del dropdown
      </.dropdown>

      <.dropdown>
        Título del dropdown
        <:options to="#algo1">
          algo
        </:options>
        <:options to="#algo2" selected="true">
          algo2
        </:options>
      </.dropdown>

      <!-- Botón para listas -->
      <.dropdown
        class="float-end"
        class_button="btn-sm float-end ms-2 border-0"
        class_dropdown=""
      >
        Título del dropdown
        <:options
          to="#algo1"
          class=""
        >
          algo
        </:options>
      </.dropdown>

  """

  def dropdown (assigns) do
    class=assigns[:class]||""
    class_button=assigns[:class_button]||""
    class_dropdown=assigns[:class_dropdown]||""
    id=assigns[:id]||"dropdownMenuButton#{Enum.random(1000..9999)}"
    ~H"""
      <div class={"dropdown #{class}"}>
        <button class={"btn dropdown-toggle #{class_button}"} type="button" id={id} data-bs-toggle="dropdown" aria-expanded="false">
          <%= render_slot(  @inner_block ) %>
        </button>
        <ul class={"dropdown-menu #{class_dropdown}"} aria-labelledby={id}>
        <%= for option  <- @options  do %>
          <li>
            <%= live_patch to: option[:to], class: "dropdown-item  #{ if option[:selected] == "true" do "active" end } #{option[:class]}" do %>
              <%= option[:title] || render_slot(  option ) %>
            <%  end %>
          </li>
        <%  end %>
        </ul>
      </div>
    """
  end
end
