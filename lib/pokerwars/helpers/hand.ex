defmodule Pokerwars.Helpers.Hand do
  def same_suit?(suits) do
    first_suit = Enum.fetch!(suits, 0)
    Enum.all?(suits, fn suit -> suit == first_suit end)
  end

  def consecutive_ranks?([current_number | [next_number | remaining_numbers]]) do
    next_number - current_number == 1 && consecutive_ranks?([next_number | remaining_numbers])
  end

  def consecutive_ranks?(_), do: true
end
