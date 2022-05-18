defmodule KajoolyTemplateBetaWeb.TreeviewLive.Config do
  use KajoolyTemplateBetaWeb, :live_view

  def treeview_config(socket) do
    %{
      to_index: "#",
      to_generals: "#",
      to_permissions: "#",
      to_usuarios: "#",
      to_new_rol: "#",

      color_close_btn: "#ff0000"
    }
  end

end
