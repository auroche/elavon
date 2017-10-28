defmodule Elavon.Batch do
  alias Elavon.Batch.Settle
  alias Elavon.Web

  @settle "settle"

  def settle(params \\ %{}) do
    params
    |> Elavon.merchant_credential()
    |> Elavon.transact(@settle)
    |> Settle.build_request()
    |> Web.send()
  end
end
