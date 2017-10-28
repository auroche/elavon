defmodule Elavon.Batch.Settle do
  @moduledoc """
  https://developer.elavon.com/#/api/eb6e9106-0172-4305-bc5a-b3ebe832f823.rcosoomi/versions/5180a9f2-741b-439c-bced-5c84a822f39b.rcosoomi/documents/?converge-integration-guide/book/transaction_types/end_of_day/settle.html
  """
  @behaviour Elavon

  alias Elavon.Batch.Settle.Changeset
  alias Elavon.Batch.Settle.Response

  def build_request(params) do
    params
    |> Changeset.changeset()
  end

  def parse_response(json) do
    json
    |> Poison.decode(as: %Response{})
  end
end
