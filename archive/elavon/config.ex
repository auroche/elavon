defmodule Elavon.Config do
  @name :elavon
  @key  Elavon

  def config, do: Application.get_env(@name, @key)
  def username, do: Keyword.get(config(), :username)
  def password, do: Keyword.get(config(), :password)
  def merchant_id, do: Keyword.get(config(), :merchant_id)
end
