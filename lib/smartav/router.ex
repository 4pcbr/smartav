# https://github.com/elixir-lang/plug/blob/master/lib/plug/adapters/cowboy.ex
# https://hexdocs.pm/plug/readme.html
defmodule Smartav.Router do
  use Plug.Router

  plug Plug.Logger
  plug :match
  plug :dispatch

  get "/hello" do
    send_resp( conn, 200, "world" )
  end

  match _ do
    send_resp( conn, 404, "Not found" )
  end

end

