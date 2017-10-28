defmodule Elavon.CreditCardResponseCode do
  @moduledoc """
  https://developer.elavon.com/#/api/eb6e9106-0172-4305-bc5a-b3ebe832f823.rcosoomi/documents/?converge-integration-guide/book/integration/auth_response_codes/credit_card_codes.html
  """

  @messages %{
    "AA" => %{"APPROVAL" => "Approved"},
    "AP" => %{"PARTIAL APPROVAL" => "Approved for a Partial Amount"},
    "N7" => %{"DECLINE CVV2" => "Do not honor due to CVV2 mismatch\failure"},
    "NC" => %{"PICK UP CARD" =>	"Pick up card"},
    "ND" => %{"AMOUNT ERROR" => "Tran Amount Error",
              "AMT OVER SVC LMT" => "Amount is more than established service limit",},
  }

# ND	AMOUNT ERROR	Tran Amount Error
# ND	AMT OVER SVC LMT	Amount is more than established service limit
# ND	APPL TYPE ERROR	Call for Assistance
# ND	CANNOT CONVERT	Check is ok, but cannot be converted. Do Not Honor
# ND	DECLINED	Do Not Honor
# ND	DECLINED T4	Do Not Honor. Failed negative check, unpaid items
# ND	DECLINED-HELP 9999	System Error
# ND	DUP CHECK NBR	Duplicate Check Number
# ND	EXPIRED CARD	Expired Card
# ND	INCORRECT PIN	Invalid PIN
# ND	INVALID CARD	Invalid Card
# ND	INVALID CAVV	Invalid Cardholder Authentication Verification Value
# ND	INVALID TERM ID	Invalid Terminal ID
# ND	INVLD R/T NBR	Invalid Routing/Transit Number
# ND	INVLD TERM ID 1	Invalid Merchant Number
# ND	INVLD TERM ID 2	Invalid SE Number
#
# Note: AMEX Only
# ND	INVLD VOID DATA	Invalid Data Submitted for Void Transaction
# ND	MAX MONTHLY VOL	The maximum monthly volume has been reached
# ND	MICR ERROR	MICR Read Error
# ND	MUST SETTLE MMDD	Must settle, open batch is over 7 days old
#
# Note: Best Practice is to settle within 24 hours. Batch will be Auto Settled after 10 days
# ND	NETWORK ERROR	General System Error
# ND	PLEASE RETRY	Please Retry/Reenter Transaction
# ND	RECORD NOT FOUND	Record not on the network
# ND	REQ. EXCEEDS BAL.	Req. exceeds balance
# ND	SEQ ERR PLS CALL	Call for Assistance
# ND	SERV NOT ALLOWED	Invalid request
# ND	TOO MANY CHECKS	Too Many Checks (Over Limit)
# NR	CALL AUTH. CENTER	Refer to Issuer
# N/A	SUCCESS	For successfully added, updated, deleted recurring or installment transactions
# N/A	ERROR	For recurring or installment transactions that failed to be added, deleted or updated



  @enforce_keys [:code, :message, :definition]
  defstruct     [:code, :message, :definition]

  def new(code, message) do
    if definition = definition(code, message) do
      {:ok, %__MODULE__{code: code, message: message, definition: definition}}
    else
      {:error, :unknown_code_or_message}
    end
  end

  def definition(code, message) do
    @messages
    |> Map.get(code, %{})
    |> Map.get(message)
  end
end
