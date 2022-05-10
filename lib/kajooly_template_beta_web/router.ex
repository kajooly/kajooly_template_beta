defmodule KajoolyTemplateBetaWeb.Router do
  use KajoolyTemplateBetaWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {KajoolyTemplateBetaWeb.LayoutView, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  page_assigns = %{
    page_suffix: Application.get_env(:kajooly_template_beta,:page_suffix) || "- Software & Startup Premium Landing Page Template",
    page_lang: Application.get_env(:kajooly_template_beta,:page_suffix) || :en,
    mode:  Application.get_env(:kajooly_template_beta, :mode) || "light",
    width:  Application.get_env(:kajooly_template_beta, :with) ||  "fluid",
    menuPosition: Application.get_env(:kajooly_template_beta, :menuPosition) || "fixed",
    sidebar: Application.get_env(:kajooly_template_beta, :sidebar) || %{color:  "light", size: "default", showuser: false},
    topbar: Application.get_env(:kajooly_template_beta, :topbar) || %{color: "dark"},
    showRightSidebarOnPageLoad: Application.get_env(:kajooly_template_beta, :showRightSidebarOnPageLoad ) || false,
    layoutsFrom: Application.get_env(:kajooly_template_beta, :layoutsFrom) || nil,
    sidebar_html_path:  Application.get_env(:kajooly_template_beta, :sidebar_html_path) || nil,
    navbar_html_path: Application.get_env(:kajooly_template_beta, :navbar_html_path) || nil,
    favicon: Application.get_env(:kajooly_template_beta, :favicon_path),
    logo_dark: Application.get_env(:kajooly_template_beta, :logo_dark_path),
    logo_light: Application.get_env(:kajooly_template_beta, :logo_light_path)

  }

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", KajoolyTemplateBetaWeb, assigns: page_assigns do
    pipe_through :browser

    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", KajoolyTemplateBetaWeb do
  #   pipe_through :api
  # end
end
