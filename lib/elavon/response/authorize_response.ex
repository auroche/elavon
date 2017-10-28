defmodule Elavon.AuthorizeResponse do
  # @keys_map %{
  #   :ssl_txn_id        => :transaction_id,        #ok
  #   :ssl_txn_time      => :transaction_time,      #ok
  #   :ssl_approval_code => :approval_code,         #ok
  #   :ssl_amount        => :amount,                #ok
  #   :ssl_requested_amount => :requested_amount,
  #   :ssl_balance_due   => :remaining_amount,
  #   :ssl_account_balance => :account_balance,
  #   :ssl_avs_response => :avs_response,           #ok
  #   :ssl_cvv2_response => :cvv_response,          #ok
  #   :ssl_card_number   => :card_number,           #ok
  #   :ssl_invoice_number => :invoice_number,       #ok
  #   :ssl_conversion_rate => :conversion_rate,
  #   :ssl_eci_ind        => :eci_ind,
  #   :ssl_transaction_currency => :currency,       #ok
  #   :ssl_card_short_description => :short_brand,
  #   :ssl_card_type      => :card_type,
  #   :ssl_token          => :token,
  #   :ssl_token_response => :token_response,
  #   :ssl_add_token_response => :add_token_response
  # }

  def parcel(%{succeed?: true, body: body}) do
    %{
      id:               body[:ssl_txn_id],
      time:             body[:ssl_txn_time],
      approval_code:    body[:ssl_approval_code],
      amount:           body[:ssl_amount],
      requested_amount: body[:ssl_requested_amount],
      remaining_amount: body[:ssl_balance_due],
      cvv_response:     body[:ssl_cvv2_response],
      card_number:      body[:ssl_card_number],
      invoice_number:   body[:ssl_invoice_number]
    }
  end
end
