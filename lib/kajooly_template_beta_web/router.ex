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
    page_suffix: Application.get_env(:kajooly_template_alfa,:page_suffix) || "- Software & Startup Premium Landing Page Template",
    page_lang: Application.get_env(:kajooly_template_alfa,:page_suffix) || :en,
    mode:  Application.get_env(:kajooly_template_alfa, :mode) || "light",
    width:  Application.get_env(:kajooly_template_alfa, :with) ||  "fluid",
    menuPosition: Application.get_env(:kajooly_template_alfa, :menuPosition) || "fixed",
    sidebar: Application.get_env(:kajooly_template_alfa, :sidebar) || %{color:  "light", size: "default", showuser: false},
    topbar: Application.get_env(:kajooly_template_alfa, :topbar) || %{color: "dark"},
    showRightSidebarOnPageLoad: Application.get_env(:kajooly_template_alfa, :showRightSidebarOnPageLoad ) || false,
    layoutsFrom: Application.get_env(:kajooly_template_alfa, :layoutsFrom) || nil,
    sidebar_html_path:  Application.get_env(:kajooly_template_alfa, :sidebar_html_path) || nil,
    navbar_html_path: Application.get_env(:kajooly_template_alfa, :navbar_html_path) || nil,
    favicon: Application.get_env(:kajooly_template_alfa, :favicon_path),
    logo_dark: Application.get_env(:kajooly_template_alfa, :logo_dark_path),
    logo_light: Application.get_env(:kajooly_template_alfa, :logo_light_path)

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
