defmodule KajoolyTemplateBetaWeb.TicketsLive.Config do
  use KajoolyTemplateBetaWeb, :live_view

  def list_config(socket, data) do
    %{
      txt_title: "Tickets",
      txt_subtitle: "Listado de tickets",
      to_index: nil,
      to_this:  Routes.tickets_show_path(socket, :show) ,
      txt_breadcrum_title: "Tickets",
      txt_total_ticket: "22,342",
      txt_pending_ticket: "2,342",
      txt_closed_ticket: "542",
      breadcrum_pages: [
          %{ title: "Tickets", to: Routes.tickets_index_path(socket, :index)},
          %{ title: "Listado de tickets", to: nil }
        ],
      titles: [
        %{
          title: "ID",
          to: "#",
          show: "md"
        },
        %{
          title: "Solicitud",
          to: "#",
          show: "md"
        },
        %{
          title: "Asunto",
          to: "#",
          show: "md"
        },
        %{
          title: "Asignación",
          to: "#",
          show: "md"
        },
        %{
          title: "Prioridad",
          to: "#",
          show: "md"
        },
        %{
          title: "Estado",
          to: "#",
          show: "md"
        },
        %{
          title: "Creado",
          to: "#",
          show: "md"
        },
        %{
          title: "Vencimiento",
          to: "#",
          show: "md"
        },
        %{
          title: "",
          to: "#",
          show: "md"
        }
      ],
      list: data.list || [
        %{
          to: Routes.tickets_show_path(socket, :show),
          hash_id: "#1256",
          requested_by: "George A. Lianes",
          to_requested_by: "#",
          subject: " Support for theme",
          assignee: "Jorge Wilson",
          to_assignee: "#",
          priority: "Low",
          priority_color: nil,
          status: "Open",
          status_color: "warning",
          created_date: "2017/04/28",
          due_date: " 2017/04/28",
          actions: [
            %{
              title: "Ver ticket",
              icon: "mdi mdi-eye me-2 text-muted font-18 vertical-middle",
              to: "#"
            },
            %{
              title: "Editar ticket",
              icon: "mdi mdi-pencil me-2 text-muted font-18 vertical-middle",
              to: "#"
            },
            %{
              title: "Cerrar ticket",
              icon: "mdi mdi-check-all me-2 text-muted font-18 vertical-middle",
              to: "#"
            },
            %{
              title: "Eliminar ticket",
              icon: "mdi mdi-delete me-2 text-muted font-18 vertical-middle",
              to: "#"
            },
            %{
              title: "Marcar como leido",
              icon: "mdi mdi-star me-2 font-18 text-muted vertical-middle",
              to: "#"
            },
          ],
        }
      ]
    }
  end

  def details_config(socket, data) do
    %{
      txt_breadcrum_title: "Tickets",
      breadcrum_pages: [
          %{ title: "Tickets", to: Routes.tickets_index_path(socket, :index) },
          %{ title: "Listado de tickets", to: Routes.tickets_index_path(socket, :index) },
          %{ title: "Detalles", to: Routes.tickets_show_path(socket, :show) },
          %{ title: "ID-TPK-4321", to: nil }
        ],
      txt_title: "Ticket #ID-TPK-4321",
      txt_subtitle: "En diseño",
      to_index: Routes.tickets_index_path(socket, :index),
      to_this:  Routes.tickets_show_path(socket, :show) ,
      options: [
        %{
          title: "Editar",
          to: "#",
          icon: "mdi mdi-pencil-outline me-1"
        },
        %{
          title: "Marcar como duplicado",
          to: "#",
          icon: "mdi mdi-content-copy me-1"
        },
        %{
          title: "Asignación",
          to: "#",
          icon: "mdi mdi-face-shimmer-outline me-1"
        },
        %{
          title: "Eliminar",
          to: "#",
          class: "text-danger",
          icon: "mdi mdi-delete-outline me-1"
        },
      ],
      hash_id: "#ID-TPK-4321",
      resume: %{
        title: "Brief para  ID-TPK-4321",
        subtitle: "Unilever S.A / Axe ",
        title_id: "Código TPK",
        hash_id: "#ID-TPK-4321",
        title_assign: "Asignado a:",
        name_assign: "Darnell McCormick",
        title_date: "Fecha",
        date: "2022-12-31",
        title_description: "Descripción",
        description: "Esta es una tarjeta más amplia con texto de apoyo a continuación como una introducción natural a contenido adicional. Este contenido es un poco más largo. Un texto de ejemplo rápido para construir sobre el título de la tarjeta y componer la mayor parte del contenido de la tarjeta. Un texto de ejemplo rápido para construir sobre el título de la tarjeta y compensar",
        title_tags: "Etiquetas",
        tags: [
          %{
            title: "Tag 1",
            to: "#",
            color: "warning"
          },
          %{
            title: "Tag 2",
            to: "#",
            color: "info"
          },
          %{
            title: "Tag 3",
            to: "#",
            color: "danger"
          },
          %{
            title: "Tag 4",
            to: "#",
            color: nil
          }
        ],
        title_checklists: "Listas de tareas",
        checklists: [
          %{
            title: "Lista de tareas 1",
            list: [
              %{
                title: "Tarea 1",
                checked: "false",
              },
              %{
                title: "Tarea 2",
                checked: "false",
              },
              %{
                title: "Tarea 3",
                checked: "false",
              },
              %{
                title: "Tarea 4",
                checked: "false",
              },
            ]
          }
        ],
        title_comments: "Comentarios (51)",
        title_filters_comments: "Reciente",
        filters_comments: [
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
        ],
        commnents: [
          %{
            user: "Barry Gould",
            text: "Buen trabajo, me hace pensar en The Money Pit.",
            date: "Hace 5 horas"
          },
          %{
            user: "Aaron Wilson",
            text: "Sería muy bueno tener.",
            date: "Hace 1 día"
          }
        ]





      }

    }
  end

end
