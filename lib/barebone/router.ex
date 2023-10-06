defmodule Barebone.Router do
  use Plug.Router

  import Plug.Conn.Query
  import Barebone.Render, only: [render_html: 2, render_html: 3, render_json: 2]
  
  plug Plug.Parsers,
    parsers: [:urlencoded, :json],
    pass: ["text/*"],
    json_decoder: Jason

  plug Plug.Static,
    at: "/",
    from: {:barebone, "priv/static"},
    only: ~w(vendor components js css images)

  plug :match
  plug :dispatch

  get "/" do
    render_html(conn, "index.html")
  end

  get "/name" do
    render_html(conn, "name.html", assigns: %{name: decode(conn.query_string)["name"]})
  end

  get "/api/message" do
    render_json(conn, %{message: "api endpoint"})
  end

  match _ do
    send_resp(conn, 404, "Oops!")
  end
end
