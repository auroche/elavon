defmodule Elavon.FakeResponse do
  @callback json() :: String.t
  @callback struct() :: map
end
