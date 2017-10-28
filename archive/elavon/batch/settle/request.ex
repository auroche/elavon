defmodule Elavon.Batch.Settle.Request do
  use Ecto.Schema

  embedded_schema do
    field :ssl_transaction_type, :string
    field :ssl_merchant_id,      :string
    field :ssl_user_id,          :string
    field :ssl_pin,              :string

    #Optional
    field :ssl_txn_id, :string # if settle all, don't send any; otherwise send id
  end
end
