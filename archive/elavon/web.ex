defmodule Elavon.Web do
  @url Application.get_env(:elavon, :api_url)
  @headers [
    {"Content-Type", "application/json"},
    {"Accept",       "text/json"},
  ]

  def send(%Ecto.Changeset{valid?: true} = request) do
    url = Elavon.Config.api_url()

    case HTTPoison.post(url, request, @headers) do
        {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
            IO.puts body
    end
  end

  def send(%Ecto.Changeset{valid?: false, errors: errors}) do
    # TODO: send out some error
    Poison.encode!(%{errors: errors})
  end

  def receive(response) do
    # TODO: rip out response for relevant data;
    # dispatch it to relevant response type
  end
end
