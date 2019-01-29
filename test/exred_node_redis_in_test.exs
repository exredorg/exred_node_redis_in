defmodule Exred.Node.RedisInTest do
  use ExUnit.Case
  doctest Exred.Node.RedisIn

  use Exred.NodeTest, module: Exred.Node.RedisIn

  setup_all do
    start_node(Exred.Node.RedisDaemon)
    start_node()
  end

  test "GET hello", context do
    Exred.Node.RedisIn.add_out_node(context.pid, self())
    msg = %{payload: ["hello"]}
    send(context.pid, msg)
    assert_receive %{payload: _}, 1000
  end
end
