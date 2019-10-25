defmodule BNO055.Registers.OprMode do
  def addr, do: <<0x3D>>

  def encode(:CONFIGMODE), do: <<0>>
  def encode(:ACCONLY), do: <<1>>
  def encode(:MAGONLY), do: <<2>>
  def encode(:GYROONLY), do: <<3>>
  def encode(:ACCMAG), do: <<4>>
  def encode(:ACCGYRO), do: <<5>>
  def encode(:MAGGYRO), do: <<6>>
  def encode(:AMG), do: <<7>>
  def encode(:IMU), do: <<8>>
  def encode(:COMPASS), do: <<9>>
  def encode(:M4G), do: <<10>>
  def encode(:NDOF_FMC_OFF), do: <<11>>
  def encode(:NDOF), do: <<12>>
end
