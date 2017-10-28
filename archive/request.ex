defmodule Elavon.Request do
  # fields required for all request
  defstruct ssl_transaction_type: nil,
            ssl_merchant_id:      nil,
            ssl_user_id:          nil,
            ssl_pin:              nil
  @doc """
  01 - Manual Entry Only
  02 - Magnetically Swipe Capability
  03 - Proximity / Contactless capable device
  04 - EMV Chip Capability (ICC) - Contact Only (w/Magstripe)
  05 - EMV Chip Capability (ICC) - Dual Interface (w/Magstripe)
  """
  @ssl_pos_mode ~w(01 02 03 04 05)
  def ssl_pos_mode(type) do
    case type do
      :manual -> "01"
      :magnet -> "02"
      :contactless -> "03"
      :emv_contact -> "04"
      :emv_dual -> "05"
      _ -> raise ArgumentError, "#{inspect type} is an unknown type"
    end
  end
  @doc """
  01 - Manual Entry Only
  02 - Key Entered - Card Present
  03 - Swiped (Default value when track Data is sent alone)
  04 - Proximity / Contactless
  """
  @ssl_entry_mode ~w(01 02 03 04)
  def ssl_entry_mode(type) do
    case type do
      :manual -> "01"
      :present -> "02"
      :magnet -> "03"
      :contactless -> "04"
    end
  end

  @doc """
  recommended to send with ssl_cvv2cvc2
  0 for Bypassed
  1 for Present
  2 for Illegible
  9 for Not Present
  """
  @ssl_cvv2cvc2_indicator ~w(0 1 2 9)
  def ssl_cvv2cbc2_indicator(type) do
    case type do
      :bypassed -> "0"
      :present -> "1"
      :illegible -> "2"
      :not_present -> "9"
    end
  end
end
