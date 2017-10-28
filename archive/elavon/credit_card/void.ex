defmodule Elavon.CreditCard.Void do
  @moduledoc """
  https://developer.elavon.com/#/api/eb6e9106-0172-4305-bc5a-b3ebe832f823.rcosoomi/versions/5180a9f2-741b-439c-bced-5c84a822f39b.rcosoomi/documents/?converge-integration-guide/book/transaction_types/credit_card/void.html
  """
  @behaviour Elavon

  alias Elavon.CreditCard.Void.Changeset
  alias Elavon.CreditCard.Void.Response

  def build_request(params) do
    params
    |> Changeset.changeset()
  end

  def parse_response(json) do
    json
    |> Poison.decode(as: %Response{})
  end
end

# defimpl Poison.Encoder, for: Elavon.CreditCard.Void.Request do
#   def encode(value, opts) do
#     Poison.Encoder.Map.encode(value, opts)
#   end
# end
