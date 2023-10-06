defmodule Primeval.Render do
  defmacro __using__(_opts) do
    quote do
      import Primeval.Render
      import Plug.Conn
      require EEx
    end
  end

  defmacro template(template_path, template_name, assigns \\ []) do
    quote do
      unquote(template_path)
      |> Path.join(unquote(template_name))
      |> String.replace_suffix(".html", ".html.eex")
      |> EEx.eval_file(unquote(assigns))
    end
  end

  defmacro json(conn, data \\ %{}) do
    quote do
      %{status: status} = unquote(conn)
      body = Jason.encode!(unquote(data))
      send_resp(unquote(conn), (status || 200), body)
    end
  end
end
