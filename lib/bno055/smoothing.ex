defmodule BNO055.Smoothing do
  alias BNO055.Circle

  def init do
    :queue.new()
  end

  def reading(q, orientation) do
    q = append_and_drop(q, orientation)
    diffs = :queue.to_list(q) |> Enum.map(fn(h) -> Circle.difference(h, orientation.heading) end)
    diff = Enum.sum(diffs) / Enum.count(diffs)
    {q, Map.put(orientation, :heading, orientation.heading + diff)}
  end

  defp append_and_drop(q, orientation) do
    q = :queue.in(orientation.heading, q)
    if :queue.len(q) > 10 do
      {_, q} = :queue.out(q)
      q
    else
      q
    end
  end
end
