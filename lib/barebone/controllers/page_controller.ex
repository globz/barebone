defmodule Barebone.Controllers.PageController do
  use Primeval.Controller
  use Primeval.Render

  @template_path "./lib/barebone/templates"
  @layout_path "./lib/barebone/templates/layout"
  
  def index(%{status: status} = conn, _params) do
    index = template(@template_path, "index.html.eex")
    body = template(@layout_path, "app.html.eex", fragment: index)

    send_resp(conn, (status || 200), body)
  end

  def name(%{status: status} = conn, params) do
    body = template(@template_path, "name.html.eex", assigns: params)

    send_resp(conn, (status || 200), body)
  end
  
end
