defmodule KajoolyTemplateBetaWeb.ExampleContactListLive.Config do
  use KajoolyTemplateBetaWeb, :live_view

  def examples_config(socket) do
    %{
      to_index: "#",
      to_generals: "#",
      to_permissions: "#",
      to_usuarios: "#",
      to_new_rol: "#",

      #breadcrum start
      breadcrum: [
        %{ title: "Lista de contactos", to: "#" },
        %{ title: "Todos", to: "#todos" },
        #%{ title: "NOMBRE DEL CONTACTO", to: nil },
        ],
      txt_title: "d.alias",
      txt_subtitle: "asd",
      to_index: nil,
      to_this:  Routes.example_contact_list_index_path(socket, :index),
      txt_count_a: "3",
      txt_a: "Llaves activas",
      txt_a_color: "warning",
      txt_count_b: nil, # to activate change to: txt_count_b: "6",
      txt_b: "Accesos activos",
      txt_b_color: "success",
      #breadcrum end

      color_close_btn: "#ff0000"
    }
  end

end
