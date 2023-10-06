defmodule Barebone.Router do
  use Plug.Router
  use Primeval.Router

  import Plug.Conn.Query

  alias Barebone.Controllers.PageController
  alias Barebone.Controllers.ApiController

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
    dispatch conn , PageController, :index
  end

  get "/name" do
    dispatch conn , PageController, :name, %{name: decode(conn.query_string)["name"]}
  end

  get "api/message" do
    dispatch conn, ApiController, :message
  end

  get "/hello/:name" do
    send_resp(conn, 200, "hello #{name}")
  end
    
  match _ do
    send_resp(conn, 404, "Oops!")
  end
end
