defmodule Elavon.Batch.Settle.FakeRequest do
  @moduledoc """
  embedded_schema do
    field :ssl_transaction_type, :string
    field :ssl_merchant_id,      :string
    field :ssl_user_id,          :string
    field :ssl_pin,              :string

    #Optional
    field :ssl_txn_id, :string # if settle all, don't send any; otherwise send id
  end
  """
  @behaviour Elavon.FakeRequest
  alias Elavon.Batch.Settle.Request
  alias Elavon.Batch.Settle.Changeset
  def params() do
    %{
      ssl_transaction_type: Faker.String.base64,
      ssl_merchant_id:      Faker.String.base64,
      ssl_user_id:          Faker.String.base64,
      ssl_pin:              Faker.String.base64,
      ssl_txn_id:           Faker.String.base64
    }
  end

  def struct() do
    %Request{}
    |> struct(params())
  end

  def changeset() do
    params()
    |> Changeset.changeset()
  end
end
