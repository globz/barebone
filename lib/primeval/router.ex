defmodule Primeval.Router do
  defmacro __using__(_opts) do
    quote do
      import Primeval.Router
    end
  end

  defmacro dispatch(conn, controller, action) do
    quote do
        apply(unquote(controller), :call, [unquote(conn), unquote(action)])
    end
  end
  
  defmacro dispatch(conn, controller, action, opts) do
    quote do
        apply(unquote(controller), :call, [unquote(conn), unquote(action), unquote(opts)])
    end
  end  
end
