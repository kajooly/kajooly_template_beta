defmodule KajoolyTemplateBetaWeb.ExampleContactListLive.Config do
  use KajoolyTemplateBetaWeb, :live_view

  def examples_config(socket) do
    %{
      txt_breadcrum_title: "Contactos",
      breadcrum_pages: [
        %{ title: "Contactos", to: Routes.tickets_index_path(socket, :index) },
        %{ title: "Listado de contactos", to: Routes.tickets_index_path(socket, :index) }
       ],


      txt_title: "Ticket #ID-TPK-4321",
      txt_subtitle: "En diseño",
      to_index: Routes.tickets_index_path(socket, :index),
      to_this:  Routes.tickets_show_path(socket, :show),
      txt_title: "Contactos",
      txt_subtitle: "Listado de clientes",
      to_index: nil,
      to_this:  Routes.example_contact_list_index_path(socket, :index),
      to_new:  Routes.example_contact_list_index_path(socket, :index),
      to_new_title: "Nuevo cliente",
      list: list_item(socket,[%{}])
    }
  end

  def list_item(socket,list)  do
    # IO.inspect list, label: "list"
    Enum.map(list, fn item ->
        %{
          title: item[:title] || "",
          subtitle: item[:subtitle] || "",
          date: item[:date] || ""
        }
    end)
  end
end
