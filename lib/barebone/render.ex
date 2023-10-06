defmodule Barebone.Render do
  import Plug.Conn
  require EEx

  @template_path "./lib/barebone/templates"
  @my_app_layout "./lib/barebone/templates/layout/app.html.eex"
  @app_layout_path "./lib/barebone/templates/layout"
  @app_layout "app.html.eex"
  
  use Barebone.Template,
    [template_path: @template_path,
    app_layout_path: @app_layout_path,
    app_layout: @app_layout]

  EEx.function_from_file :defp, :app_layout, @my_app_layout, [:fragment]
  
  # defp render_layout(fragment) do
  #     @app_layout
  #     |> EEx.eval_file(fragment: fragment)
  # end
  
  def render_html(%{status: status} = conn, template, assigns \\ []) do
    body =
      @template_path
      |> Path.join(template)
      |> String.replace_suffix(".html", ".html.eex")
      |> EEx.eval_file(assigns)
      |> app_layout

    send_resp(conn, (status || 200), body)
  end

  def render_json(%{status: status} = conn, data) do
    body = Jason.encode!(data)
    send_resp(conn, (status || 200), body)
  end
end
