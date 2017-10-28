defmodule Elavon.CreditCard do
  alias Elavon.CreditCard.{
    AuthOnly, Void
  }
  alias Elavon.Web

  @authorize "ccauthonly"
  @void      "ccvoid"

  def authorize(params) do
    params
    |> Elavon.merchant_credential()
    |> Elavon.transact(@authorize)
    |> AuthOnly.build_request()
    |> Web.send()
    |> AuthOnly.parse_response()
  end

  def void(params) do
    params
    |> Elavon.merchant_credential()
    |> Elavon.transact(@void)
    |> Void.build_request()
    |> Web.send()
    |> Void.parse_response()
  end
end
