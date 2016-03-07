defmodule Smartav.CLI do

  def main( argv ) do
    argv
      |> parse_args
      |> run!
  end

  def parse_args( argv ) do
    parse = OptionParser.parse(
      argv,
      switches: [ :help, :boolean ],
      aliases: [ :h, :help ],
    )
    case parse do
      { [ help: true ], _, _ } -> :help
      { _, [ command ], _ } -> command
      _ -> nil
    end
  end

  def run!( :help ) do
  IO.puts """
  usage: smartav run
  """
  end

  def run!( "run" ) do
    { :ok, pid } = Plug.Adapters.Cowboy.http Smartav.Router, [ acceptors: 1000, compress: false, timeout: 5000 ]
    IO.puts "Web server successfully started"
    receive do
      { _ } ->
    end

  end

  def run!( cmd ) do
    IO.puts "Unknown command #{cmd}"
    run!( :help )
  end

end

