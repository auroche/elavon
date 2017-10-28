defmodule Elavon.RequestEnvelope do
  alias CommerceCure.Envelope

  @keys_map %{
    action:    :ssl_transaction_type,
    username:  :ssl_user_id,
    password:  :ssl_pin,
    ssl_merchant_id: :ssl_merchant_id,

    # cc
    payment_card_number:             :ssl_card_number,
    payment_card_expiry_date:        :ssl_exp_date,
    payment_card_validation_value:   :ssl_cvv2cvc2,
    #styf
    ssl_cvv2cvc2_indicator: :ssl_cvv2cvc2_indicator,
    ssl_card_present:       :ssl_card_present,
    ssl_token: :ssl_token,

    ssl_pos_mode: :ssl_pos_mode,
    ssl_entry_mode: :ssl_entry_mode,

    ssl_partial_auth_indicator: :ssl_partial_auth_indicator,
    ssl_customer_code: :ssl_customer_code,
    ssl_salestax: :ssl_salestax,
    ssl_dynamic_dba: :ssl_dynamic_dba,
    ssl_departure_date: :ssl_departure_date,
    ssl_completion_date: :ssl_completion_date,

    currency: :ssl_transaction_currency,
    ssl_show_form: :ssl_show_form,
    ssl_track_data: :ssl_track_data,
    ssl_ksn: :ssl_ksn,
    ssl_get_token: :ssl_get_token,
    ssl_add_token: :ssl_add_token,
    ssl_invoice_number: :ssl_invoice_number,
    ssl_invoice_number: :ssl_description,
  }

  def put_payment_card(envelope, payment_card) do
    envelope
    |> Map.merge(%{
      ssl_card_number: payment_card[:number],
      ssl_exp_date: payment_card[:expiry_date],
    })
    |> put_validation_value(payment_card)
  end

  def put_validation_value(envelope, %{validation_value: vv}) do
    envelope
    |> Map.put(:ssl_cvv2cvc2, vv)
    |> Map.put(:ssl_cvv2cvc2_indicator, "1")
  end
  def put_validation_value(envelope, _), do: envelope


end
