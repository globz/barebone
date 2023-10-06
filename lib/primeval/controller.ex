defmodule Primeval.Controller do
  defmacro __using__(_opts) do
    quote do
      def call(conn, action) do
        apply(__MODULE__, action, [conn, "Controller here"])
      end
      def call(conn, action, params) do
        apply(__MODULE__, action, [conn, params])
      end      
      defoverridable(call: 2, call: 3)
    end
  end
end

