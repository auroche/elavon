defmodule Elavon.CreditCard.Void.Response do
  defstruct ssl_result:           nil, # outcome of transaction (if 0 then approved transaction. containing any other value, it was declined)
            ssl_result_message:   nil, # APPROVAL, PARTIAL APPROVAL, DECLINED
            ssl_txn_time:         nil, # MM/DD/YYY hh:mm:ss AM/PM
            ssl_txn_id:           nil,
            ssl_approval_code:    nil,
            ssl_invoice_number:   nil,
            ssl_email:            nil,
            errorCode:            nil,
            errorName:            nil,
            errorMessage:         nil
end
