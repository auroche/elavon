defmodule Elavon.CreditCard.Void.Changeset do
  import Ecto.Changeset

  alias Elavon.CreditCard.Void.Request

  @in_ssl_transaction_type ["ccvoid"]

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
    :ssl_pin,
    :ssl_txn_id
  ]

  def changeset(params) do
    %Request{}
    |> cast(params, @castp)
    |> validate_required(@reqp)
    |> validate_inclusion(:ssl_transaction_type, @in_ssl_transaction_type)
  end
end
