defmodule BNO055.Circle do
  def difference(desired, heading) do
    case desired - heading do
      diff when diff < -180.0 -> diff + 360.0
      diff when diff > 180.0 -> diff - 360.0
      diff -> diff
    end
  end

  @max_angle 360.0
  def wrap(heading) when heading > @max_angle do
    heading - @max_angle
  end
  def wrap(heading) when heading < 0.0 do
    @max_angle + heading
  end
  def wrap(heading), do: heading
end
