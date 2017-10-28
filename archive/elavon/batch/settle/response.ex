defmodule Elavon.Batch.Settle.Response do
  defstruct ssl_result:           nil, # outcome of transaction (if 0 then approved transaction. containing any other value, it was declined)
            ssl_result_message:   nil, # APPROVAL, PARTIAL APPROVAL, DECLINED
            ssl_txn_time:         nil, # MM/DD/YYY hh:mm:ss AM/PM
            ssl_txn_id:           nil,
            ssl_txn_main_count:   nil,
            ssl_txn_main_amount:  nil,
            ssl_txn_cash_count:   nil,
            ssl_txn_cash_amount:  nil,
            ssl_txn_loyalty_count:    nil,
            ssl_txn_loyalty_amount:   nil,
            ssl_txn_ecg_count:    nil,
            ssl_txn_ecg_amount:   nil,
            errorCode:            nil,
            errorName:            nil,
            errorMessage:         nil
end
