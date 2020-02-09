defmodule BNO055 do
  @moduledoc """
  A library for interacting with a BNO055 n-degrees-of-freedom chip
  """

  alias Circuits.I2C
  alias BNO055.Registers.OprMode
  @addr 40
  @heading_register <<0x1A>>

  defstruct [:i2c, :opts]

  def setup(mode, opts \\ []) do
    {:ok, ref} = I2C.open(Keyword.get(opts, :i2c_device, "i2c-1"))
    :ok = I2C.write(ref, @addr, [OprMode.addr(), OprMode.encode(mode)])
    %__MODULE__{i2c: ref, opts: opts}
  end

  def orientation(%__MODULE__{i2c: ref}) do
    case I2C.write_read(ref, @addr, @heading_register, 6) do
      {:ok, <<heading :: little-signed-size(16), roll :: little-signed-size(16), pitch :: little-signed-size(16)>> } ->
        orientation = %{
          heading: heading / 16.0,
          roll: roll / 16.0,
          pitch: pitch / 16.0
        }
        {:ok, orientation}
      other -> {:error, other}
    end
  end
end
