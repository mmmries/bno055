defmodule BNO055.SmoothingTest do
  use ExUnit.Case, async: true
  alias BNO055.Smoothing

  test "it averages out fluctuations in the heading" do
    smoothing = Smoothing.init()
    {smoothing, orientation} = Smoothing.reading(smoothing, %{heading: 103.375, pitch: 26.8125, roll: 1.9375})
    assert orientation == %{heading: 103.375, pitch: 26.8125, roll: 1.9375}
    {smoothing, orientation} = Smoothing.reading(smoothing, %{heading: 111.375, pitch: 26.8125, roll: 1.9375})
    assert orientation == %{heading: 107.375, pitch: 26.8125, roll: 1.9375}
    {smoothing, _orientation} = Smoothing.reading(smoothing, %{heading: 103.375, pitch: 26.8125, roll: 1.9375})
    {_smoothing, orientation} = Smoothing.reading(smoothing, %{heading: 111.375, pitch: 26.8125, roll: 1.9375})
    assert orientation == %{heading: 107.375, pitch: 26.8125, roll: 1.9375}
  end

  test "it averages out numbers near the 0 point" do
    smoothing = Smoothing.init()
    {smoothing, orientation} = Smoothing.reading(smoothing, %{heading: 1.0, pitch: 2.0, roll: 1.0})
    assert orientation == %{heading: 1.0, pitch: 2.0, roll: 1.0}
    {smoothing, orientation} = Smoothing.reading(smoothing, %{heading: -1.0, pitch: 2.0, roll: 1.0})
    assert orientation == %{heading: 0.0, pitch: 2.0, roll: 1.0}
    {smoothing, _orientation} = Smoothing.reading(smoothing, %{heading: 361.0, pitch: 2.0, roll: 1.0})
    {_smoothing, orientation} = Smoothing.reading(smoothing, %{heading: 359.0, pitch: 2.0, roll: 1.0})
    assert orientation == %{heading: 360.0, pitch: 2.0, roll: 1.0}
  end
end
