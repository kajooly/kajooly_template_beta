defmodule KajoolyTemplateBetaWeb.RolesLive.Config do
  use KajoolyTemplateBetaWeb, :live_view

  def roles_config(socket) do
    %{
      to_index: Routes.roles_index_path(socket, :index),
      to_generals: Routes.roles_edit_generals_path(socket, :index),
      to_permissions: Routes.roles_edit_permissions_path(socket, :index),
      to_usuarios: Routes.roles_edit_users_path(socket, :index),
      to_new_rol: Routes.roles_index_path(socket, :new, %{id: ""}),
      to_section_usuarios: "#user-section",


      txt_title: "Roles",
      txt_page_title: "Roles",
      txt_title_generals: "Configuración general" ,
      txt_title_permissions: "Permisos" ,
      txt_title_users: "Lista de usuarios" ,
      txt_tab_generals: "Generales",
      txt_tab_permissions: "Permisos",
      txt_tab_users: "Usuarios",
      txt_add_users: "Agregar usuario",
      txt_add_rol: "Agregar Rol",
      txt_search: "Buscar",
      txt_desc_index: "Usa los roles para organizar a los miembros de tu servidor y personalizar sus permisos. Puedes asignar roles en la página de ",
      txt_desc_index_btn: "Miembros",
      txt_index_actions_edit: " Editar Rol",
      txt_index_actions_view_users: "Ver Miembros",
      txt_index_actions_remove: "Borrar Rol",
      txt_index_qty_users: "usuarios",


      color_close_btn: "#ff0000"
    }
  end

end
