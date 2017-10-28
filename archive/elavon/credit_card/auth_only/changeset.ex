defmodule Elavon.CreditCard.AuthOnly.Changeset do
  import Ecto.Changeset

  alias Elavon.CreditCard.AuthOnly.Request
  
  @r_digits ~r/^[0-9]+$/
  @r_amount ~r/^\d{1,}(.\d{1,3})?$/
  @r_mmyy   ~r/^((0[0-9])|(1[12]))\d{2}$/
  @r_yn     ~r/^[YyNn]$/
  @r_mmddyyyy ~r/^((0[0-9])|(1[12]))\/(3[01]|[012]\d)\/\d{4}$/

  @r_ssl_cvv2cvc2 ~r/^\d{3,4}$/

  @n_ssl_partial_auth_indicator [equal_to: 1]

  @l_ssl_transaction_currency [is: 3]

  @in_ssl_transaction_type ["ccauthonly"]
  @in_yn ~w(Y N)
  @in_ssl_pos_mode ~w(01 02 03 04 05)
  @in_ssl_entry_mode ~w(01 02 03 04)
  @in_ssl_cvv2cvc2_indicator ~w(0 1 2 9)

  @castp [
    :ssl_transaction_type,
    :ssl_merchant_id,
    :ssl_user_id,
    :ssl_pin,
    :ssl_amount,
    :ssl_card_number,
    :ssl_exp_date,
    :ssl_card_present,
    :ssl_cvv2cvc2,
    :ssl_cvv2cvc2_indicator,
    :ssl_token,
    :ssl_pos_mode,
    :ssl_entry_mode,
    :ssl_partial_auth_indicator,
    :ssl_customer_code,
    :ssl_salestax,
    :ssl_dynamic_dba,
    :ssl_departure_date,
    :ssl_completion_date,
    :ssl_transaction_currency,
    :ssl_track_data,
    :ssl_ksn,
    :ssl_get_token,
    :ssl_add_token,
    :ssl_invoice_number,
    :ssl_description
  ]
  @reqp [
    :ssl_transaction_type,
    :ssl_merchant_id,
    :ssl_user_id,
    :ssl_pin,
    :ssl_amount
  ]

  def changeset(params) do
    %Request{}
    |> cast(params, @castp)
    |> validate_required(@reqp)
    |> validate_inclusion(:ssl_transaction_type, @in_ssl_transaction_type)
    |> validate_format(:ssl_amount, @r_amount)
    |> validate_format(:ssl_exp_date, @r_mmyy)
    |> validate_inclusion(:ssl_card_present, @in_yn)
    |> validate_format(:ssl_cvv2cvc2, @r_ssl_cvv2cvc2)
    |> validate_inclusion(:ssl_cvv2cvc2_indicator, @in_ssl_cvv2cvc2_indicator)
    |> validate_inclusion(:ssl_pos_mode, @in_ssl_pos_mode)
    |> validate_inclusion(:ssl_entry_mode, @in_ssl_entry_mode)
    |> validate_number(:ssl_partial_auth_indicator, @n_ssl_partial_auth_indicator)
    |> validate_format(:ssl_salestax, @r_amount)
    |> validate_format(:ssl_departure_date, @r_mmddyyyy)
    |> validate_format(:ssl_completion_date, @r_mmddyyyy)
    |> validate_length(:ssl_transaction_currency, @l_ssl_transaction_currency)
    |> validate_inclusion(:ssl_get_token, @in_yn)
    |> validate_inclusion(:ssl_add_token, @in_yn)
  end

  @hand_keyed_reqp [
    :ssl_card_number,
    :ssl_exp_date
  ]
  def validate_hand_keyed(%Ecto.Changeset{} = changeset) do
    changeset
    |> validate_required(@hand_keyed_reqp)
  end

  @magnetic_strip_reqp [
    :ssl_track_data,
    :ssl_ksn
  ]
  defp validate_magnetic_strip(%Ecto.Changeset{} = changeset) do
    changeset
    |> validate_required(@magnetic_strip_reqp)
  end
end
