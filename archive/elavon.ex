defmodule Elavon do
  alias Elavon.Config

  def merchant_credential do
    %{
      ssl_merchant_id: Config.merchant_id(),
      ssl_user_id:     Config.username(),
      ssl_pin:         Config.password()
    }
  end

  def merchant_credential(map) do
    Map.merge(map, merchant_credential())
  end

  def transact(transaction_type) do
    transact(%{}, transaction_type)
  end

  def transact(map, transaction_type) do
    Map.put(map, :ssl_transaction_type, transaction_type)
  end

  @callback build_request(params :: map)
            :: Ecto.Changeset.t
  @callback parse_response(json :: String.t)
            :: {:ok, struct :: map}
             | {:error, :invalid}
             | {:error, {:invalid, String.t}}

  defmacro __using__(arg) do
    quote bind_quoted: [arg: arg] do
      changeset = Keyword.get(arg, :changeset) || __MODULE__.Changeset
      request = Keyword.get(arg, :request) || __MODULE__.Request
      response = Keyword.get(arg, :response) || __MODULE__.Response
      def build_request(params) do
        params
        |> unquote(changeset).changeset()
      end

      def parse_response(json) do
        json
        |> Poison.decode(as: %unquote(response){})
      end
    end
  end
end
