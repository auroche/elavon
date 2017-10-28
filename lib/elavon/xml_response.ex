defmodule Elavon.XmlResponse do
  use CommerceCure.Response

  def process_body(body) do
    body = body
    |> Keyword.get(:txn)
    |> Enum.reduce(%{}, fn
      {_, []}, map ->
        map
      {k, v}, map ->
        Map.put(map, k, v)
    end)
    {:ok, body}
  end

  def process_error(body) do
    cond do
      code = Map.get(body, :errorCode) ->
        name = Map.get(body, :errorName)
        message = Map.get(body, :errorMessage)
        {:ok, %{code: code, name: name, message: message}}
      (code = Map.get(body, :ssl_result)) != "0" ->
        message = Map.get(body, :ssl_result_message)
        {:ok, %{code: code, message: message}}
      true ->
        {:ok, nil}
    end
  end
end
