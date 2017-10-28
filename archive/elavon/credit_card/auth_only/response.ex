defmodule Elavon.CreditCard.AuthOnly.Response do
  defstruct ssl_result:           nil, # outcome of transaction (if 0 then approved transaction. containing any other value, it was declined)
            ssl_result_message:   nil, # APPROVAL, PARTIAL APPROVAL, DECLINED
            ssl_txn_id:           nil, # unique identifier
            ssl_txn_time:         nil, # MM/DD/YYY hh:mm:ss AM/PM
            ssl_approval_code:    nil,
            ssl_amount:           nil,
            ssl_requested_amount: nil,
            ssl_balance_due:      nil,
            ssl_account_balance:  nil,
            ssl_avs_response:     nil,
            ssl_cvv2_response:    nil,
            ssl_card_number:      nil,
            ssl_invoice_number:   nil,
            ssl_conversion_rate:  nil,
            ssl_eci_ind:          nil,
            ssl_transaction_currency: nil,
            ssl_card_short_description:   nil,
            ssl_card_type:        nil,
            ssl_token:            nil,
            ssl_token_response:   nil,
            ssl_add_token_response:   nil,
            # return only with error
            errorCode:            nil,
            errorMessage:         nil,
            errorName:            nil

end
