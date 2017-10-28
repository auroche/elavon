defmodule Elavon.CreditCard.Void.Request do
  use Ecto.Schema

  embedded_schema do
    field :ssl_transaction_type, :string
    field :ssl_merchant_id,      :string
    field :ssl_user_id,          :string
    field :ssl_pin,              :string
    field :ssl_txn_id,           :string
  end
end
