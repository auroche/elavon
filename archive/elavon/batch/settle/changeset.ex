defmodule Elavon.Batch.Settle.Changeset do
  import Ecto.Changeset

  alias Elavon.Batch.Settle.Request

  @in_ssl_transaction_type ["settle"]

  @castp [
    :ssl_transaction_type,
    :ssl_merchant_id,
    :ssl_user_id,
    :ssl_pin,
    :ssl_txn_id
  ]
  @reqp [
    :ssl_transaction_type,
    :ssl_merchant_id,
    :ssl_user_id,
    :ssl_pin
  ]
  def changeset(params) do
    %Request{}
    |> cast(params, @castp)
    |> validate_required(@reqp)
    |> validate_inclusion(:ssl_transaction_type, @in_ssl_transaction_type)
  end
end
