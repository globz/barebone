defmodule Barebone.Template do
  defmacro __using__(opts) do
    quote location: :keep, bind_quoted: [opts: opts] do
      require EEx
      
      # behavior goes here

      template_path = Keyword.get(opts, :template_path)
      app_layout_path = Keyword.get(opts, :app_layout_path)
      app_layout = Keyword.get(opts, :app_layout)
      Barebone.Template.lol("lol")

      
      
    end
  end
  
  def lol(args) do
    IO.write(args)
  end    
end



# defmacro compile_template(dir, template, assigns \\ []) do
#   quote do
#     fun_name_atom = String.to_atom(unquote(template))
#     template_path =
#       unquote(dir)
#       |> Path.join(unquote(template))
#       |> String.replace_suffix(".html", ".html.eex")

#     use EEx
#     EEx.function_from_file :defp, fun_name_atom, template_path, unquote(assigns)
#   end
# end
