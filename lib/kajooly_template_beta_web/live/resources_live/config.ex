defmodule KajoolyTemplateBetaWeb.ResourcesLive.Config do
  use KajoolyTemplateBetaWeb, :live_view

  def resources_config(socket) do
    %{
      to_index: Routes.resources_index_path(socket, :index),

      txt_title: "Recursos",
      txt_page_title: "Recursos",
      txt_title_generals: "Configuración general" ,
      txt_title_permissions: "Permisos" ,
      txt_title_users: "Lista de usuarios" ,
      txt_tab_generals: "Generales",
      txt_tab_permissions: "Permisos",
      txt_tab_users: "Usuarios",
      txt_add_users: "Agregar usuario",
      txt_add_rol: "Agregar Recursos",
      txt_search: "Buscar",
      txt_desc_index: "Usa los Recursos para organizar los espacios de trabajo o empresas que requieras administrar ",
      txt_index_actions_edit: " Editar Recursos",
      txt_index_actions_view_users: "Ver Miembros",
      txt_index_actions_rol: "Ver Roles",
      txt_index_actions_remove: "Borrar Recursos",
      txt_index_qty_users: "usuarios",


      color_close_btn: "#ff0000"
    }
  end

end
