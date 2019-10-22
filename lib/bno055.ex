defmodule BNO055 do
  @moduledoc """
  A library for interacting with a BNO055 n-degrees-of-freedom chip
  """

  alias Circuits.I2C
  alias BNO055.Registers.OprMode
  @addr 40

  defstruct [:i2c, :opts]

  def setup(mode, opts \\ []) do
    {:ok, ref} = I2C.open(Keyword.get(opts, :i2c_device, "i2c-1"))
    :ok = I2C.write(ref, @addr, <<OprMode.addr(), OprMode.encode(mode)>>)
    %__MODULE__{i2c: ref, opts: opts}
  end
end
