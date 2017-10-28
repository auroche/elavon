defmodule Elavon.Error do
  @moduledoc """
  https://developer.elavon.com/#/api/eb6e9106-0172-4305-bc5a-b3ebe832f823.rcosoomi/documents/?converge-integration-guide/book/integration/auth_response_codes/error_codes.html
  """
  @messages %{
    "3000" => "Error, no response."
  }

#   CODE	ERROR NAME	DEFAULT MESSAGE
# 3000	Gateway not responding	Error, no response.
# 3001	Gateway generated error	#.
# 3002	Adapter generated error	#.
# 4000	VID Not Supplied	The Converge ID was not supplied in the authorization request.
# 4002	HTTP Trans Not Allowed	HTTP POST transactions are not allowed for this account.
# 4003	HTTP Referrer Invalid	HTTP POST transactions are not allowed for this HTTP Referrer.
# 4005	E-mail Address Invalid	The e-mail address supplied in the authorization request appears to be invalid.
# 4006	CVV2 Not Requested With Data	The CVV2 indicator was not identified in the authorization request.
# 4007	CVV2 Requested But No Data	CVV2 check cannot be performed as no data was supplied in the authorization request.
# 4009	Required Field Not Supplied	A required field was not supplied in the authorization request.
# 4010	Invalid Transaction Type	An invalid Transaction Type was supplied in the authorization request.
# 4011	Receipt URL Missing	The Receipt URL supplied in the authorization request appears to be blank or invalid.
# 4013	PIN Not Supplied	The PIN was not supplied in the authorization request.
# 4014	Not Permitted	This terminal or user ID is not permitted to process this transaction type.
# 4016	Permission Denied	This account does not have permission to process # transactions.
# 4017	Time-Out	The request has timed out. The allotted time to complete the request has ended. Please try again.
# 4018	Settlement is in progress	Settlement is in progress, Void failed.
# 4019	User ID not supplied	The User ID was not supplied in the authorization request.
# 4022	The system is unavailable	The system is unavailable. This transaction request has not been approved. Please try again later.
# 4023	Settlement is not allowed for this terminal	Settlement is not allowed for this terminal.
# 4025	Invalid Credentials	The credentials supplied in the authorization request are invalid.
# 5000	Credit Card Number Invalid	The Credit Card Number supplied in the authorization request appears to be invalid.
# 5001	Exp Date Invalid	The Credit Card Expiration Date supplied in the authorization request appears to be invalid.
# 5002	Amount Invalid	The amount supplied in the authorization request appears to be invalid.
# 5003	Approval Code/No Force	A FORCE Approval Code was supplied for this transaction, however the transaction type is not FORCE.
# 5004	Invalid Approval Code	The FORCE Approval Code supplied in the authorization request appears to be invalid or blank. The FORCE Approval Code must be 6 or less alphanumeric characters.
# 5005	Field Character Limit Exceeded	The value for the # field is too long. # characters (maximum) are allowed. Your entry contains # characters.<br>If you entered the value for this field, use the browser BACK button to return to the order form and modify the field value accordingly. Otherwise, contact Customer Service at <a href=“mailto:#”>#</a>.
# 5006	Refund Amount Exceeds Limit	The refund amount for this transaction ($#) may not exceed $#.
# 5007	Sales Tax Invalid	The Sales Tax supplied in the authorization request appears to be invalid.
# 5008	Invalid Account Type	This PINLess Debit Transaction contains invalid account type. Account type can be checking or saving.
# 5009	Invalid Surcharge Amount	Invalid Surcharge amount for the PIN less debit transaction.
# 5010	Invalid EGC Transaction type	An invalid EGC Transaction type has been supplied with this request.
# 5011	Invalid EGC Tender Type	An invalid EGC Tender type has been supplied with this request.
# 5012	Invalid Track Data	The track data sent appears to be invalid.
# 5013	Invalid Track 2 data	Transaction requires Track2 data to be sent.
# 5014	Missing Pin Data	Transaction requires a PIN entry or encrypted PIN device.
# 5015	Invalid Voucher Number	The value for the Voucher Number (ssl_voucher_number) field should be 15 digits in length. This value must be numeric.
# 5016	Invalid MICR Data	The MICR Data sent appears to be invalid.
# 5017	MICR data and image mismatch	The image uploaded doesn’t match the MICR data sent for that check.
# 5018	Missing MAC value	The MAC value sent appears to be incorrect.
# 5019	Minimum Length Error	Minimum Field Character Limit not reached.
# 5020	Invalid Field	The Field does not apply to this transaction type.
# 5021	Invalid CVV2 Value	The value for the CVV2 (ssl_cvv2cvc2) field should be 3 or 4 digits in length. This value must be numeric.
# 5022	Invalid CVV2 Indicator Value	The value for the CVV2 indicator (ssl_cvv2cvc2_indicator) field should be 1 Numeric Character only. Valid values are: 0, 1, 2, 9.
# 5023	Invalid card present indicator	Card Present indicator sent is invalid.
# 5024	CashBack Amount Invalid	The Cash back amount supplied in the authorization request appears to be invalid.
# 5025	Invalid Key pointer	The value for the key pointer (ssl_key_pointer) field should be 1 Character only. Valid value is: T for Triple-DES DUKPT.
# 5030	Invalid Billing cycle	The billing cycle specified is not a valid entry.
# 5031	Invalid Payment date	The next payment date specified is not a valid entry.
# 5032	Invalid installment number	The installment number specified is invalid.
# 5033	Invalid recurring ID	The recurring ID is not valid.
# 5034	Invalid installment ID	The installment ID is not valid.
# 5035	Recurring Limit exceeded	The recurring batch has exceeded the 20,000 transactions limit.
# 5036	Installment payments completed	Installment payments completed.
# 5037	Invalid end of month value	Invalid end of month value.
# 5038	Invalid half of month value	Invalid half of month value.
# 5039	Half of month and next payment date combination mismatch	The half of the month value provided [value] doesn’t correspond with the next payment date of [value].
# 5040	Invalid Transaction ID	Transaction ID is invalid for this transaction type.
# 5041	Exceeded the 10 minutes window	Unable to void transaction, exceeds the 10mn window.
# 5042	Swipe data is not allowed for this market segment	Swipe data is not allowed for this market segment. Please rekey the card data.
# 5043	End Of Month and Next Payment Date combination mismatch	The end of the Month value provided [value] doesn’t correspond with the next payment date of [value].
# 5050	Invalid tip	Tip Amount is invalid.
# 5055	Missing response file name	The response file name is missing. Please provide a response file name and try again.
# 5056	Invalid response file name	The response file name is invalid. Please make sure the response file name doesn’t contain any of the characters :
#
# \ / : * ? “ < > |
# 5057	Missing batch file	The batch file is missing. Please make sure the file exists and try again.
# 5058	Invalid batch file name	The batch file name you provided is too long. The file name cannot exceed 30 characters.
# 5059	Invalid batch file format	The batch file you uploaded is invalid. Please make sure that the file is properly formatted.
# 5060	Invalid batch file extension	The batch file you uploaded has an incorrect extension. Please make sure the file is in either CSV or XML format and try again.
# 5061	Import Batch in Progress, retry later	Import Batch in Progress, retry later.
# 5062	File Exceeds Max Number of Transactions	File Exceeds Max Number of Transactions.
# 5063	File already imported	File already imported.
# 5064	Invalid fields in the batch file	The batch file you uploaded is invalid. Please make sure that the file is properly formatted and file doesn’t contain any (fieldname) field or values.
# 5065	Invalid response file length	The response file name you provided is too long. The response file name cannot exceed 30 characters.
# 5066	Batch Import Limit exceeded	The number of import batch files has exceeded the limit allowed within 24 hours.
# 5067	Invalid transaction type present in batch file	The batch file you uploaded is invalid. Please make sure that the file contains valid and supported transaction types. For a complete list of all supported transaction types please consult manual.
# 5068	Error processing batch	There was an error in processing your batch. If this issue persist please contact Technical Support at 1-800-377-3962, option 2 then option 2 (in Canada you are asked to choose either English or French for you language).
# 5069	Invalid Batch Import Request	Only Multipart Form Data request are accepted.
# 5070	Signature already in System	Transaction ID sent has a signature associated to it in the system.
# 5071	Signature format Invalid	All signature images must be BASE64 encoded.
# 5072	Signature type Invalid	Signature image type valid values (JPG, GIF, TIF, or PNG).
# 5073	Signature image exceeds size limitation	Signature image exceeds the 10K size quota.
# 5074	Signature is not allowed for this market segment	Signature is not allowed for this market segment.
# 5078	The MasterPass wallet is unavailable	The MasterPass wallet is currently unavailable, please retry at later time.
# 5079	MasterPass is not setup for this terminal	You must setup your terminal to accept MasterPass before sending this value.
# 5080	Values for ssl_3dsecure_value and ssl_xid are required	Values for ssl_3dsecure_value and ssl_xid are required.
# 5081	Value for ssl_xid is required	Value for ssl_xid is required.
# 5083	Invalid DBA name	The DBA name cannot contain special characters and based on the DBA prefix setup for your terminal, this value cannot exceed 21 , 17 or 12 characters long.
# 5085	Invalid Token	The token supplied in the authorization request appears to be invalid.
# 5086	Invalid card information	The card information supplied in the authorization request appears to be invalid. You cannot provide both token and card number for processing.
# 5087	Transaction currency is not allowed for this terminal	Transaction currency is not allowed for this terminal. You must be setup with Multi-Currency to specify a transaction currency.
# 5088	Transaction currency is not allowed for this Card Type	In order to process Multi-Currency you must use either a Visa or a MasterCard, you can also process this card type in the merchant local currency.
# 5089	Invalid Transaction Currency	The transaction currency sent is not correct. Please provide the correct 3-digit ISO code.
# 5090	Invalid BIN Override Value	Invalid BIN Override Value.
# 5091	Invalid Amount	The amount exceeds the original transaction amount.
# 5092	Invalid country code	Invalid country code.
# 5093	Transaction Time Exceeded	Transaction has timed out, you may retry at later time.
# 5094	Invalid Travel information	The travel departure or completion dates specified are not valid. Dates should be formatted as MM/DD/YYYY and cannot be in the past.
# 5095	Invalid Search Criteria	Too many search criteria were entered for this query. Modify the search and try again.
# 5096	Invalid Transaction Currency	The currency sent doesn’t match the original transaction currency.
# 5097	Missing Travel information	The Departure Date and the Completion Date must be sent together.
# 5098	Invalid Transaction Currency	The transaction currency sent is not supported for this terminal.
# 5099	Invalid Search Date	Search dates must be formatted as MM/DD/YYYY or MM/DD/YYYY hh:mm:ss AM/PM, the end date must be greater than the start date and the range cannot be greater than 31 days.
# 5100	Account Closed	This account has been closed by Account Updater.
# 5101	MICR/Image Data is not allowed for this terminal	MICR read or check image is not allowed for this terminal. Your terminal must be setup for ECS Paper Check.
# 5102	Keyed Check is not allowed for this terminal	Key entered check is not allowed for this terminal. Your terminal must be setup for ACH ECheck.
# 5103	Invalid bank account type value	The value for the check type (ssl_bank_account_type) field should be 1 Numeric Character only. Valid values are: 0 for Personal, 1 for Business.
# 5104	Invalid agreement indicator value	The value for the agreement indicator (ssl_agree) field should be 1 Numeric Character only. Valid values are: 1 for Agree, 0 for Do not agree.
# 5105	Invalid Bank Account Number	The bank account number supplied in the authorization request appears to be invalid. The bank account number must numeric and up to 16 characters long.
# 5106	Invalid Bank Routing Number	The bank routing number supplied in the authorization request appears to be invalid. The bank routing number must be numeric fixed value of 9 characters.
# 5107	Invalid Check Number	The Check number supplied in the authorization request appears to be invalid. The check number must be numeric.
# 5108	Missing check holder information	The check information supplied in the request appears to be missing. You must provide first and last names for a personal check or a company name for a business check.
# 5121	Invalid Mobile indicator	The mobile indicator appears to be missing or invalid.
# 5122	Invalid Merchant IP Address	The IP Address appears to be missing or invalid.
# 5123	Email is not setup for this terminal	Email is not setup for this terminal. You must enable the email options under the email setup form.
# 5125	Invalid POS, entry mode and card data combination	POS entry and entry mode combination is invalid for this transaction.
# 5126	Invalid mobile source	Invalid mobile source.
# 5130	EMV processing is not allowed for this card type.	You can process this card type swiped or keyed.
# 5131	Swiped without fallback is not allowed	Chip read must fail before fallback to swipe is allowed. You must attempt to insert card first.
# 5132	Signature is not allowed for this card	Card verification method for this card does not require a signature
# 5133	Invalid Card Type.	Transaction not supported with this card type.
# 5135	Invalid Search Transaction Type	Transaction type provided in the request is not valid. Valid values are: SALE, VOID, FORCE.
# 5136	Invalid Search Amount	The amount supplied in the search appears to be invalid. All amounts must be formatted correctly and max amount must be greater than the min amount if supplied.
# 5137	Invalid Search Card Type	The card type supplied in the search appears to be invalid. Valid values are: CREDITCARD, DEBITCARD.
# 5138	Invalid Search Card Brand	The card brand supplied in the search appears to be invalid. Valid values are: VISA, MC, JCB, DISC, AMEX.
# 6001	Manual Transaction Declined	Transaction request was unable to be completed.
# 6002	Declined: Invalid Card	This transaction request has not been approved. You may elect to use another form of payment to complete this transaction or contact customer service for additional options.
# 6003	Declined: Pick up Card	This transaction request has not been approved. You may elect to use another form of payment to complete this transaction or contact customer service for additional options.
# 6004	Declined: Amount Error	This transaction request has not been approved. You may elect to use another form of payment to complete this transaction or contact customer service for additional options.
# 6005	Declined: Appl. Type Error	This transaction request has not been approved. You may elect to use another form of payment to complete this transaction or contact customer service for additional options.
# 6006	Declined	This transaction request has not been approved. You may elect to use another form of payment to complete this transaction or contact customer service for additional options.
# 6007	Declined: Help	This transaction request has not been approved. You may elect to use another form of payment to complete this transaction or contact customer service for additional options.
# 6008	Declined: Req. Exceeds Bal.	This transaction request has not been approved. You may elect to use another form of payment to complete this transaction or contact customer service for additional options.
# 6009	Declined: Expired Card	This transaction request has not been approved. You may elect to use another form of payment to complete this transaction or contact customer service for additional options.
# 6010	Declined: Incorrect PIN	This transaction request has not been approved. You may elect to use another form of payment to complete this transaction or contact customer service for additional options.
# 6011	Declined: Invalid Term ID	This transaction request has not been approved. You may elect to use another form of payment to complete this transaction or contact customer service for additional options.
# 6012	Declined: Invalid Term ID 1	This transaction request has not been approved. You may elect to use another form of payment to complete this transaction or contact customer service for additional options.
# 6013	Declined: Invalid Term ID 2	This transaction request has not been approved. You may elect to use another form of payment to complete this transaction or contact customer service for additional options.
# 6014	Declined: Invalid Void Data	This transaction request has not been approved. You may elect to use another form of payment to complete this transaction or contact customer service for additional options.
# 6015	Declined: Must Settle MMDD	This transaction request has not been approved. You may elect to use another form of payment to complete this transaction or contact customer service for additional options.
# 6016	Declined: Not On File	This transaction request has not been approved. You may elect to use another form of payment to complete this transaction or contact customer service for additional options.
# 6017	Declined: Record Not Found	This transaction request has not been approved. You may elect to use another form of payment to complete this transaction or contact customer service for additional options.
# 6018	Declined: Serv Not Allowed	This transaction request has not been approved. You may elect to use another form of payment to complete this transaction or contact customer service for additional options.
# 6019	Declined: Seq Err Pls Call	This transaction request has not been approved. You may elect to use another form of payment to complete this transaction or contact customer service for additional options.
# 6020	Declined: Call Auth Center	This transaction request has not been approved. You may elect to use another form of payment to complete this transaction or contact customer service for additional options.
# 6021	Declined: Call Ref.	This transaction request has not been approved. You may elect to use another form of payment to complete this transaction or contact customer service for additional options.
# 6022	Declined: CVV2	This transaction request has not been approved. You may elect to use another form of payment to complete this transaction or contact customer service for additional options.
# 6023	Declined: Please RetryXXXX	This transaction request has not been approved. You may elect to use another form of payment to complete this transaction or contact customer service for additional options.
# 6024	Card Already Active	The Gift Card is already active.
# 6025	Request Exceeds Balance	Transaction amount exceeds the Gift Card balance amount.
# 6026	Cannot Load The Amount Specified	Cannot Load The Amount Specified.
# 6027	Card Not Activated	The Gift Card Is Not Activated.
# 6028	Card Cannot Be Reloaded	The Gift Card Cannot Be Reloaded.
# 6029	Declined: Invalid Reg Key	Invalid Reg Key.
# 6030	Declined: Invalid Packet	Invalid Packet.
# 6031	Declined: Invalid LRC	Invalid LRC.
# 6032	Declined: Invalid Response	Invalid Response.
# 6033	Declined: Invalid LRC in Response	Invalid LRC in Response.
# 6034	Declined: Invalid Record Number in Response	Invalid Record Number in Response.
# 6038	System is Temporarily Unavailable	It appears that the system is temporarily unavailable. Please try your transaction again in a few minutes or contact the merchant you are trying to order from for further assistance. We apologize for this inconvenience.
# 6042	Invalid Request Format	XML request is not well-formed or request is incomplete.
# 7005	Invalid Token Request	The information supplied in the request is invalid. A token cannot be added unless one has been requested.

  @enforce_keys [:code, :name, :message]
  defstruct     [:code, :name, :message]

  def new!(code, name, message) do
    %__MODULE__{code: code, name: name, message: message}
  end
end
