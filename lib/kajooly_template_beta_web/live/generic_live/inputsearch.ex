defmodule KajoolyTemplateBetaWeb.GenericLive.Inputsearch do
  import Phoenix.LiveView
  import Phoenix.LiveView.Helpers

  @doc """

  InpitSearch

  Live Controler code:

    import KajoolyTemplateBetaWeb.GenericLive.Inputsearch

  ## Examples

      <!-- Simple -->
      <.inputsearch>
      </.inputsearch>


  """
  def inputsearch (assigns) do
    ~H"""
      <div class="input-group">
            <input class="form-control border-end-0 border" type="text" placeholder="Buscar rol..." id="example-search-input">
            <span class="input-group-append">
                <button class="btn btn-outline-secondary bg-white border-start-0 border ms-n3" type="button">
                    <i class="fa fa-search"></i>
                </button>
            </span>
      </div>
    """
  end
end
