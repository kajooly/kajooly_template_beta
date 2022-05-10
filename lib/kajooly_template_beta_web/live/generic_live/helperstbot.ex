defmodule KajoolyTemplateBetaWeb.GenericLive.Helperstbot do
  use KajoolyTemplateBetaWeb, :live_view

  def displaymoney(assigns) do
    assigns = assign_new(assigns,:symbol, fn -> [] end)
    assigns = assign_new(assigns,:color, fn -> [] end)
    ~H"""
    <%= live_patch to: @go_to, class: "row rounded fx px-2" do %>

      <div class={"col-3 text-light p-1 text-center rounded-start d-none d-md-block price-change-#{@color}-gray"}>
      <%= @symbol %>
      </div>
      <div class={"col-9 price-change-#{@color}-gray-light rounded-end p-1 text-end small"}>
        <%= render_slot(@inner_block) %>
      </div>
      <% end %>
    """
  end
end
