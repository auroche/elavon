defmodule Elavon.ElectronicGiftCardResponseCode do
  @moduledoc """
  https://developer.elavon.com/#/api/eb6e9106-0172-4305-bc5a-b3ebe832f823.rcosoomi/documents/?converge-integration-guide/book/integration/auth_response_codes/electronic_gift_card_codes.html
  """

#   CODE	MESSAGE	DEFINITION
# AA	APPROVAL	Approved
# ND	SERV NOT ALLOWED	Invalid request
# ND	INVLD TERM ID 1	Invalid Merchant Number
# ND	SEQ ERR PLS CALL	Call for Assistance
# ND	APPL TYPE ERROR	Call for Assistance
# 01	DECLINED-HELP 9999	Host Busy
# 02	INVALID CARD	Invalid Card
# 03	INVALID TERM ID	Invalid Terminal ID
# 04	AMOUNT ERROR	Tran Amount Error
# 05	ALREADY ACTIVE	Card already active
# 06	REQ. EXCEEDS BAL.	Request exceeds balance
# 07	Message MAX REACHED	Definition Cannot load the amount specified
# 08	NON RELOADABLE	The card cannot be reloaded
# 09	TRAN NOT ALLOWED	Transaction type not allowed
# 10	INVLD TRAN TYPE	Transaction type not on server
# 11	EXPIRED CARD	Expired card or bad expiration date
# 12	CARD NOT ACTIVE	The Gift Card is not activated
# 13	DUPLICATE TRAN	Duplicate transaction
# 14	SEQ ERR PLS CALL	Call for Assistance
# 15	SEQ ERR PLS CALL	Sequence does not match previous response
# 16	INVALID BATCH ID	Batch ID is not on the server
# 17	INVALID TENDER	Tender types is not on the server
# 99	DECLINED-HELP 9999	General System Error

  @messages %{
    "AA" => %{"APPROVAL" => "Approved"},
    "ND" => %{"SERV NOT ALLOWED" => "Invalid request",
              "INVLD TERM ID 1" => "Invalid Merchant Number",
              "SEQ ERR PLS CALL" => "Call for Assistance",
              "APPL TYPE ERROR" => "Call for Assistance"},
    "01" => %{"DECLINED-HELP 9999" => "Host Busy"},
  }

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
