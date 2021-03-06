# Bno055

A library for working with a [BNO055](https://www.bosch-sensortec.com/bst/products/all_products/bno055) chip

## Usage

The BNO055 chip has a *lot* of configurability.
This library is focused on making it easy to get up-and-running quickly with default configurations.
For details on what can be configured [please see the datatsheet](https://cdn-shop.adafruit.com/datasheets/BST_BNO055_DS000_12.pdf).

Here's a sample of basic usage:

```
{:ok, chip} = BNO055.setup(:NDOF)
{:ok, {heading, pitch, yaw}} = BNO055.orientation(chip)
```

## Physical Setup

When installing the chip you should orient the chip so that the edge with 4 pins (ps0, ps1, int and adr) is facing forward, and the pins are pointing up.
With the chip in this orientation you can now interpret the orientation data as follows:
* heading of 180.0 is magnetic north, 0.0 or 360.0 is magnetic south
* positive pitch means the nose is pointing up, negative is nose down
* positive roll means rolling to the right, negative means rolling left

## Installation

This package will be [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `bno055` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:bno055, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). The docs can be found at [https://hexdocs.pm/bno055](https://hexdocs.pm/bno055).

