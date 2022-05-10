defmodule KajoolyTemplateBetaWeb.GenericLive.List do
  import Phoenix.LiveView
  import Phoenix.LiveView.Helpers
  import KajoolyTemplateBetaWeb.GenericLive.Icons
  import KajoolyTemplateBetaWeb.GenericLive.Dropdown

  @spec list(map) :: Phoenix.LiveView.Rendered.t()
  @doc """

  List

  Live Controler code:

  import KajoolyTemplateBetaWeb.LayoutLive.List

  import KajoolyTemplateBetaWeb.GenericLive.Dropdown
  import KajoolyTemplateBetaWeb.GenericLive.Icons

  ## Examples

  tasks = [
      %{
        title: "Título 1",
        name_user: "Nombre del solicitante",
        date: "12/10/2022",
        label: "Etiqueta / Rol",
        section: "Asignación",
        color: "info",
        to: "#"
      },
      %{
        title: "Nombre de la tarea",
        name_user: "Julio Alberto P.",
        date: "12/10/2022",
        label: "Técnico",
        section: "Urgente",
        color: "danger",
        to: "#"
      }
    ]

    ----

    <.list let={entry} list={tasks}>
    <.item_list to="#">
      <:icon>
        <.name_user text="Nombre de usuario" class="me-2 " />
      </:icon>
      <:title>Title</:title>
      <:subtitle>Subtitle</:subtitle>
      <:label color="info"}>Label</:label>
      <:actions>
        <.dropdown class="float-end" class_button="btn-sm float-end ms-2 border-0">
          <.icons_dots_vertical/>
          <:options to="#opcion">
            Opción 1
          </:options>
        </.dropdown>
      </:actions>
    </.item_list>

  </.list>
  """
  def list(assigns) do
    assigns = assign_new(assigns, :other, fn -> [] end)
    list = assigns.list || []
    ~H"""
    <div class="row">
      <div class="col-12">
        <div class="my-0 px-0 rounded shadow-sm  pt-2">
          <%= for item <- list do %>
            <%= render_slot(@inner_block, item) %>
          <% end %>
        </div>
      </div>
    </div>
    """
  end

  def list_h(assigns) do
    assigns = assign_new(assigns, :other, fn -> [] end)
    list = assigns.list || []
    ~H"""
      <div class={assigns[:class]||""}>
      <%= for item <- list do %>
        <%= if item.title != nil do %>
        <%= render_slot(@inner_block, item) %>
        <% end %>
      <% end %>
      </div>
    """
  end
   @doc """

  Item list

  ## Examples

  <.item_list to="#">
    <:title>Title</:title>
    <:subtitle>Subtitle</:subtitle>
    <:label color="info"}>Label</:label>
  </.item_list>

  ---


  import KajoolyTemplateBetaWeb.GenericLive.Dropdown
  import KajoolyTemplateBetaWeb.GenericLive.Icons
  --
  <.item_list to="#">
    <:icon>
      <.name_user text="Nombre de usuario" class="me-2 " />
    </:icon>
    <:title>Title</:title>
    <:subtitle>Subtitle</:subtitle>
    <:label color="info"}>Label</:label>
    <:actions>
      <.dropdown class="float-end" class_button="btn-sm float-end ms-2 border-0">
        <.icons_dots_vertical/>
        <:options to="#opcion">
          Opción 1
        </:options>
      </.dropdown>
    </:actions>
  </.item_list>

  """
  def item_list(assigns) do
    ~H"""
    <div class={"d-flex mb-1 border-start ps-1 border-4 border-#{assigns.data[:color]} #{ if assigns.data[:read_status] == "new" do "" else " bg-body " end  } py-2"}>

    <div class="flex-3 pt-1">
    <%= render_slot(@icon) %>
    </div>
      <%= if assigns[:to] == nil do %>
        <div class="flex-1">
          <div class="float-end lh-1 text-end">
            <span class={"badge badge-soft-secondary  mb-1 "}><%= render_slot(@label) %></span>
            &nbsp;
            <span class={"badge bg-#{assigns.data[:color]}  mb-1 "}><%= assigns.data[:section] %></span>
            &nbsp;
            <p class="text-muted small w-100  mb-0 text-end"> <%= assigns.data[:date] %> </p>
          </div>
          <h5 class="mt-0 mb-1 fs-5"><%= render_slot(@title) %></h5>
          <span class="text-muted font-13"><%= render_slot(@subtitle) %></span>
        </div>
      <% else %>
        <%= live_patch to: assigns[:to],  class: "flex-1" do %>
          <div class="float-end lh-1 text-end">
            <span class={"badge badge-soft-secondary  mb-1 "}><%= render_slot(@label) %></span>
            &nbsp;
            <span class={"badge bg-#{assigns.data[:color]}  mb-1 "}><%= assigns.data[:section] %></span>
            &nbsp;
            <p class="text-muted small w-100  mb-0 text-end"> <%= assigns.data[:date] %> </p>
          </div>
          <h5 class="mt-0 mb-1 fs-5"><%= render_slot(@title) %></h5>
          <span class="text-muted font-13"><%= render_slot(@subtitle) %></span>
        <% end %>
      <% end %>
      <div class="flex-3">
      <%= render_slot(@actions) %>
      </div>
      </div>
    """
  end


   @doc """

  Item list users

  ## Examples

  <.item_list_users to="#">
    <:title>Title</:title>
    <:subtitle>Subtitle</:subtitle>
    <:label color="info"}>Label</:label>
  </.item_list_users>

  ---


  import KajoolyTemplateBetaWeb.GenericLive.Dropdown
  import KajoolyTemplateBetaWeb.GenericLive.Icons
  --
  <.item_list_users to="#">
    <:icon>
      <.name_user text="Nombre de usuario" class="me-2 " />
    </:icon>
    <:title>Title</:title>
    <:subtitle>Subtitle</:subtitle>
    <:label color="info"}>Label</:label>
    <:actions>
      <.dropdown class="float-end" class_button="btn-sm float-end ms-2 border-0">
        <.icons_dots_vertical/>
        <:options to="#opcion">
          Opción 1
        </:options>
      </.dropdown>
    </:actions>
  </.item_list_users>

  """
  def item_list_users(assigns) do
    ~H"""
    <div class={"d-flex mb-1 border-start ps-1 border-4 border-#{assigns.data[:color]} #{ if assigns.data[:read_status] == "new" do "" else " bg-body " end  } py-2"}>

    <div class="flex-3 pt-1">
     <%= render_slot(@icon) %>
    </div>
      <%= if assigns[:to] == nil do %>
        <div class="flex-1">
            <h5 class="mt-0 mb-1 fs-5"><%= render_slot(@title) %></h5>
            <span class="text-muted font-13"><%= render_slot(@subtitle) %></span>
        </div>
      <% else %>
        <%= live_patch to: assigns[:to],  class: "flex-1" do %>
          <h5 class="mt-0 mb-1 fs-5"><%= render_slot(@title) %></h5>
          <span class="text-muted font-13"><%= render_slot(@subtitle) %></span>
        <% end %>
      <% end %>
      </div>
    """
  end

  @doc """

 Item list title

 ## Examples

 <.item_list_title to="#">
   <:title>Title</:title>
   <:subtitle>Subtitle</:subtitle>
 </.item_list_title>

 ---

 """
 def item_list_title(assigns) do
   ~H"""
   <div class={"d-flex mb-1 border-start ps-1 border-4 border-#{assigns.data[:color]} #{ if assigns.data[:read_status] == "new" do "" else " bg-body " end  } py-2 #{assigns[:class]}" }>
     <%= if assigns[:to] == nil do %>
       <div class="flex-1">
           <h5 class="mt-0 mb-1 fs-5"><%= render_slot(@title) %></h5>
           <span class="text-muted font-13"><%= render_slot(@subtitle) %></span>
       </div>
     <% else %>
       <%= live_patch to: assigns[:to],  class: "flex-1" do %>
         <h5 class="mt-0 mb-1 fs-5"><%= render_slot(@title) %></h5>
         <span class="text-muted font-13"><%= render_slot(@subtitle) %></span>
       <% end %>
     <% end %>
     </div>
   """
 end

  @doc """

 Item list title

 ## Examples

 <.item_list_title_actions to="#" data={ %{color: "success"} }>
   <:title>Title</:title>
   <:subtitle>Subtitle</:subtitle>
   <:actions> < .. Dropdown .. > </:actions>
 </.item_list_title_actions>

 ---

 """
 def item_list_title_actions(assigns) do
   ~H"""
   <div class={"d-flex mb-1 border-start ps-1 border-4 border-#{assigns[:color] || "pr"} #{ if assigns[:read_status] == "new" do "" else " bg-body " end  } py-2 #{assigns[:class]}" }>


   <%= if assigns[:icon] != nil do %>
      <div class="flex-3 pt-1 pe-2">
        <%= render_slot(@icon) %>
      </div>
    <% end %>
      <%= if assigns[:to] == nil do %>
        <div class="flex-1">
            <h5 class="mt-0 mb-1 fs-5"><%= render_slot(@title) %></h5>
            <span class="text-muted font-13"><%= render_slot(@subtitle) %></span>
        </div>
      <% else %>
        <%= live_patch to: assigns[:to],  class: "flex-1" do %>
          <h5 class="mt-0 mb-1 fs-5"><%= render_slot(@title) %></h5>
          <span class="text-muted font-13"><%= render_slot(@subtitle) %></span>
        <% end %>
      <% end %>
      <div class="flex-3">
        <%= render_slot(@actions) %>
      </div>
    </div>
   """
 end


end
