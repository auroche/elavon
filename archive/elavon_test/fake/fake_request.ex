defmodule Elavon.FakeRequest do
  @callback params() :: map
  @callback struct() :: map
  @callback changeset() :: map

  def struct(%{__struct__: _} = struct, params) do
    struct
    |> struct(params)
  end
end
