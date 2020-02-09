defmodule BNO055.CircleTest do
  use ExUnit.Case
  alias BNO055.Circle

  describe "wrap" do
    test "wrapping leaves normal values alone" do
      assert Circle.wrap(0.0) == 0.0
      assert Circle.wrap(36.33) == 36.33
      assert Circle.wrap(180.55) == 180.55
      assert Circle.wrap(359.99) == 359.99
    end

    test "wrapping handles small edge cases" do
      assert Circle.wrap(-15.5) == 344.5
      assert Circle.wrap(-1.0) == 359.0
      assert Circle.wrap(360.5) == 0.5
      assert Circle.wrap(372.25) == 12.25
    end
  end

  describe "difference" do
    test "returns the relative angle between to headings" do
      assert Circle.difference(25.0, 0.0) == 25.0
      assert Circle.difference(300.0, 200.0) == 100.0
      assert Circle.difference(180.0, 200.0) == -20.0
      assert Circle.difference(180.0, 300.0) == -120.0
    end

    test "it switches direction when the relative angle is over 180°" do
      assert Circle.difference(180.0, 0.0) == 180.0
      assert Circle.difference(181.0, 0.0) == -179.0
    end

    test "it handles wrap arounds at the end of the circle" do
      assert Circle.difference(10.0, 0.0) == 10.0
      assert Circle.difference(10.0, 350.0) == 20.0

      assert Circle.difference(355.0, 0.0) == -5.0
      assert Circle.difference(355.0, 10.0) == -15.0
    end
  end
end
