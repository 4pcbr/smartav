defmodule SmartavRouterTest do
  use ExUnit.Case
  use Plug.Test
  doctest Smartav.Router

  @opts Smartav.Router.init([])

  test "hello world" do
    conn = conn( :get, "/hello" )
    conn = Smartav.Router.call( conn, @opts )
    assert conn.state == :sent
    assert conn.status == 200
    assert conn.resp_body == "world"
  end

end
