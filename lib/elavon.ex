defmodule Elavon do
  use CommerceCure, otp_app: :elavon

  alias CommerceCure.{PaymentCard, Transaction, Token}

  plug CommerceCure.Tesla.XML
  plug CommerceCure.Tesla.InjectBody, prefix: "xmldata="
  plug Tesla.Middleware.Headers, %{"content-type" => "application/x-www-form-urlencoded",
                                   "accept" => "application/xml"}

  @actions %{
    purchase: "CCSALE",
    credit: "CCCREDIT",
    refund: "CCRETURN",
    authorize: "CCAUTHONLY",
    capture: "CCFORCE",
    capture_complete: "CCCOMPLETE",
    void: "CCDELETE",
    store: "CCGETTOKEN",
    update: "CCUPDATETOKEN",
  }

  def init(action) do
    %{
      ssl_transaction_type: pick_action(action),
      ssl_user_id: fetch_config(:username),
      ssl_pin:     fetch_config(:password),
      ssl_merchant_id: fetch_config(:merchant_id)
     }
  end

  def enclose(map) do
    %{txn: map}
  end

  def purchase(money, payment_card, info \\ %{}, opts \\ [])
  def purchase(money, payment_card, info, _opts) do
    init(:purchase)
    |> put_money(money)
    |> put_payment_card(payment_card)
    |> put_sales_tax(info)
    |> put_invoice(info)
    |> put_address(info)
    |> put_customer(info)
    |> put_test_mode(info)
    |> put_ip(info)
    |> enclose()
  end

  def authorize(money, payment_card, info \\ %{}, opts \\[])
  def authorize(money, payment_card, info, _opts) do
    init(:authorize)
    |> put_money(money)
    |> put_payment_card(payment_card)
    |> put_sales_tax(info)
    |> put_invoice(info)
    |> put_address(info)
    |> put_customer(info)
    |> put_test_mode(info)
    |> put_ip(info)
    |> enclose()
  end

  def capture(money, authorization, info \\ %{})
  def capture(money, authorization, %{payment_card: payment_card} = info) do
    init(:capture)
    |> put_money(money)
    |> put_payment_card(payment_card)
    |> put_authorization(authorization)
    |> put_invoice(info)
    |> put_customer(info)
    |> put_test_mode(info)
  end

  def capture(money, authorization, info) do
    init(:capture_complete)
    |> put_money(money)
    |> put_transaction(authorization)
    |> put_partial_shipment_flag(info)
    |> put_test_mode(info)
  end

  def void(transaction, info \\ %{})
  def void(transaction, info) do
    init(:void)
    |> put_transaction(transaction)
    |> put_test_mode(info)
  end

  def refund(money, transaction, info \\ %{})
  def refund(money, transaction, info) do
    init(:refund)
    |> put_money(money)
    |> put_transaction(transaction)
    |> put_test_mode(info)
  end

  def verify(payment_card, info \\ %{})
  def verify(payment_card, info) do
    raise ArgumentError, "verify is not yet implemented"
    init(:verify)
    |> put_payment_card(payment_card)
  end

  def credit(money, payment_card, info \\ %{})
  def credit(money, payment_card, info) do
    raise ArgumentError, "credit is not yet implemented"
    init(:credit)
    |> put_money(money)
    |> put_payment_card(payment_card)
    |> put_invoice(info)
    |> put_address(info)
    |> put_customer(info)
    |> put_test_mode(info)
  end

  def store(payment_card, info \\ %{})
  def store(payment_card, info) do
    raise ArgumentError, "store is not yet implemented"
    init(:store)
    |> put_payment_card(payment_card)
    |> put_address(info)
    |> put_customer(info)
    |> put_verification(info)
    |> set_add_token()
    |> put_test_mode(info)
  end

  def update(token, payment_card, info \\ %{})
  def update(token, payment_card, info) do
    raise ArgumentError, "update is not yet implemented"
    init(:update)
    |> put_token(token)
    |> put_payment_card(payment_card)
    |> put_address(info)
    |> put_customer(info)
    |> put_test_mode(info)
  end

  defp put_money(request, %Money{} = money) do
    request
    |> Map.put(:ssl_amount, Money.to_string(money, symbol: false, separator: ""))
    # |> Map.put(:ssl_transaction_currency, "#{Map.get(money, :currency)}")
  end

  # STUB
  defp put_payment_card(request, %Token{} = _payment_card) do
    request
  end

  defp put_payment_card(request, %PaymentCard{} = payment_card) do
    request
    |> Map.put(:ssl_card_number, payment_card[:number])
    |> Map.put(:ssl_exp_date, payment_card[:expiry_date])
    |> put_verification_value(payment_card)
  end

  defp put_verification_value(request, %{verification_value: vv}) do
    request
    |> Map.put(:ssl_cvv2cvc2, vv)
    |> Map.put(:ssl_cvv2cvc2_indicator, "1")
  end

  defp put_authorization(request, %{approval_code: approval_code, transaction_id: transaction_id}) do
    request
    |> Map.put(:ssl_approval_code, approval_code)
    |> Map.put(:ssl_txn_id, transaction_id)
  end

  defp put_transaction(request, %{transaction_id: transaction_id}) do
    request
    |> Map.put(:ssl_txn_id, transaction_id)
  end

  defp put_transaction(request, %Transaction{id: id}) do
    request
    |> Map.put(:ssl_txn_id, id)
  end

  ### STUBS

  defp put_sales_tax(request, sales_tax) do
    request
  end

  defp put_invoice(request, invoice) do
    request
  end

  defp put_address(request, address) do
    request
  end

  defp put_customer(request, customer) do
    request
  end

  defp put_test_mode(request, info) do
    request
  end

  defp put_ip(request, info) do
    request
  end

  defp put_verification(request, info) do
    request
  end

  defp put_partial_shipment_flag(request, info) do
    request
  end

  defp put_token(request, token) do
    request
  end

  defp set_add_token(request) do
    Map.put(request, :ssl_add_token, "Y")
  end

  defp pick_action(action) do
    Map.get(@actions, action) || raise ArgumentError, "#{inspect action} is invalid"
  end
end
