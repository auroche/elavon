defmodule ElavonTest do
  use ExUnit.Case

  alias Elavon.XmlResponse
  alias CommerceCure.PaymentCard

  test "purchase" do

    amount = Money.new(1000, :CAD)

    {:ok, cc} = PaymentCard.new(%{
      number: "5472063333333330",
      name: "Jim Raynor",
      expiry_date: "07/19",
      verification_value: "123"
    })

    request = Elavon.purchase(amount, cc) |> IO.inspect
    http_response = Elavon.send(request)
    response = XmlResponse.new!(http_response) |> IO.inspect(pretty: true)
    assert response.succeed?

  end

  test "fail purchase" do
    amount = Money.new(1000, :CAD)

    {:ok, cc} = PaymentCard.new(%{
      number: LuhnAlgorithm.make_checksum!("5472063333333330"),
      name: "Jim Raynor",
      expiry_date: "07/19",
      verification_value: "123"
    })

    request = Elavon.purchase(amount, cc)
    http_response = Elavon.send(request)
    response = XmlResponse.new!(http_response) |> IO.inspect(pretty: true)
    refute response.succeed?
  end
end
