defmodule Barebone.Controllers.ApiController do
  use Primeval.Controller
  use Primeval.Render

  def message(conn, _params) do
    json(conn, %{message: "Hi from [message] API endpoint!"})
  end
  
end
