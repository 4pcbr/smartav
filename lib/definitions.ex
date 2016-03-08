defmodule Definitions do
  # See https://github.com/bitwalker/exprotobuf
  use Protobuf, from: Path.wildcard( "protobufs/*.proto" ), use_package_names: true, namespace: "Elixir"
end

