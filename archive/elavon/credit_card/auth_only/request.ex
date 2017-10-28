defmodule Elavon.CreditCard.AuthOnly.Request do
  use Ecto.Schema
  import Ecto.Changeset

  embedded_schema do
    field :ssl_transaction_type, :string
    field :ssl_merchant_id,      :string
    field :ssl_user_id,          :string
    field :ssl_pin,              :string
    field :ssl_amount,           :string

    # hand keyed
    field :ssl_card_number,        :string
    field :ssl_exp_date,           :string
    field :ssl_card_present,       :string
    field :ssl_cvv2cvc2,           :string
    field :ssl_cvv2cvc2_indicator, :string
    field :ssl_token,              :string

    # swiped or contactless
    field :ssl_pos_mode, :string
    field :ssl_entry_mode, :string

    # partial auth
    field :ssl_partial_auth_indicator, :integer

    # purchasing_card
    field :ssl_customer_code, :string  # format?
    field :ssl_salestax,      :string

    # dba
    field :ssl_dynamic_dba, :string # format?

    # travel
    field :ssl_departure_date, :string
    field :ssl_completion_date, :string

    # Multi-Currency
    field :ssl_transaction_currency, :string

    # converge form only for process.do
    # field :ssl_show_form, :string

    # magtek
    field :ssl_track_data, :string # ssl_encrypted_track1_data and/or ssl_encrypted_track2_data ; for ingenico: ssl_enc_track_data.
    field :ssl_ksn,        :string # Key Serial Number

    # token
    field :ssl_get_token, :string
    field :ssl_add_token, :string # requires cardholder first/last and card data

    # optional
    field :ssl_invoice_number, :string
    field :ssl_description,    :string
  end
end
