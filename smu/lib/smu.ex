defmodule Smu do
  use Application
  @moduledoc """
  Documentation for `Smu`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Smu.hello()
      :world

  """
  def start(_type, _args) do
    {:ok, cwd} = File.cwd()
    loop(%{msg: "Starting smu shell", cwd: cwd})
  end

  def loop(state) do
    message = state[:msg]
    IO.puts message
    IO.write prefix(state)
    cmd = String.trim(IO.read(:line))
    loop(Map.put(state, :msg, cmd))
    {:ok, self()}
  end

  def prefix(state) do
    user = IO.ANSI.light_blue() <> "peter" <> IO.ANSI.light_white() <> " @ "
    cwd = IO.ANSI.magenta() <> state[:cwd] <> IO.ANSI.yellow() <> " ▹ " <> IO.ANSI.reset()
    user <> cwd
  end

end
