# KajoolyTemplateBeta

### Install 
 ```
 defp deps do
    [
      {:kajooly_template_beta, git: "https://github.com/kajooly/kajooly_template_beta.git"}
    ]
  end
  ```
  if you want to use a version, define it with tag:"", after the dependency url, example:

  ```
  defp deps do
    [
      {:kajooly_template_beta, git: "https://github.com/kajooly/kajooly_template_beta.git", tag: "0.0.5"}
    ]
  end
  ```

### Run Dev Server

Create .env file

.env
```
UP_SERVER=true

```

#Bash
```
  chmod +x env.load.sh
  source env.load.sh
  mix phx.server
```

Run: http://localhost:4080/

### configs in the config file 
In the configuration file confix.exs found in the config folder, add the following lines just before `import_config #{config_env()}.exs"`,  using the order in which they are written

```
 import_config "../deps/kajooly_template_beta/config/config.exs"
 ```

```
config(:kajooly_template_beta,
    page_suffix: " - Software & Startup Premium Landing Page Template",
    page_lang: :en,
    mode: "light",
    width: "fluid",
    menuPosition: "fixed",
    sidebar: %{
      color:  "light",
      size: "default",
    showuser: false},
    topbar: %{color: "dark"},
    showRightSidebarOnPageLoad: false,
    layoutsFrom: MyApp.LayoutView,
    sidebar_html_path: "partials/body/left-menu.html",
    navbar_html_path: "partials/body/navbar.html",
    favicon_path: "/assets/images/favicon.ico",
    logo_dark_path: "/assets/images/logo-dark.png",
    logo_light_path: "/assets/images/logo-light.png")
```

The variants for the configuration variables are the following:

 * mode: "light or "dark"
 * menuPosition: "fixed" or "scroleable"
  * sidebar:
      * color: "light", "dark", "brand", "gradient"
      * size: "default", "compact", "condensed"
  * topbar: 
      * color: "light", "dark"
  * showRightSidebarOnPageLoad: true or false
  


### Config in the endpoint file 

in the endpoint file, it is necessary to add the plug, so that the graphic resources used can be recognized, it is recommended to add the following configuration just above the one that comes by default

```
  plug Plug.Static,
    at: "/",
    from: :kajooly_template_beta,
    gzip: false
```

### add in your router 

changes in the pipeline configuration, in this case the default is ` :brower`, in the part of `plug :put_root_layout`, make the change to `KajoolyTemplateBetaWeb.LayoutView, : root`, an example:

```
 pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    #plug :put_root_layout, {MyApp.LayoutView, :root}
    plug :put_root_layout, {KajoolyTemplateBetaWeb.LayoutView, :root}  # change to KajoolyTemplateBetaWeb.LayoutView, :root
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end
```



```
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
 ```
 #### Add assigns: page_assigns in the scope
 
 example: 
  ```
  scope "/", MyApp, assigns: page_assigns do
    pipe_through :browser

    get "/", PageController, :index
  end
 ```
 



 
## Examples Live Components 

### Breadcrum

Live Controler code:

```
  import KajoolyTemplateBetaWeb.GenericLive.Breadcrum

```

Heex code:

```
  <.breadcrum>
      Breadcrum title
  </.breadcrum>

  <.breadcrum to="#" >
      Return
  </.breadcrum>

  <.breadcrum to="#" >
      Section page
      <:page to="#">Page name</:page>
      <:page to="#">Page name</:page>
      <!-- you can place more than one tag :page -->
      <:page >Final page name</:page>
  </.breadcrum>
```

### Tab Select

Live Controler code:

```
   import KajoolyTemplateBetaWeb.GenericLive.Tabs

```

Heex code:

```
  <.tab_select>
    <:tab to="#" selected="true">Page name 1</:tab>
    <:tab to="#">Page name 2</:tab>
    <:tab>Page name 3</:tab>
  </.tab_select>

  <.tab_select id="OTHERID">
    Other title with out page selected
    <:tab to="#">Page name 1</:tab>
    <:tab">Page name 2</:tab>
    <:tab to="#">Page name 3</:tab>
  </.tab_select>
```
  