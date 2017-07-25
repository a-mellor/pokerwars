defmodule Pokerwars.Hand do
  alias Pokerwars.Card
  alias Pokerwars.Helpers.Hand, as: Helper
  
  def score(cards) do
    sorted_cards = Enum.sort(cards, fn c, n -> c.rank <= n.rank end)
    evaluate(sorted_cards)
  end

  defp evaluate(cards) do
    suits = Enum.map(cards, fn card -> card.suit end)
    ranks = Enum.map(cards, fn card -> card.rank end)
    cond do
      Helper.same_suit?(suits) && Helper.consecutive_ranks?(ranks) ->
        :straight_flush
      Helper.x_of_a_kind?(ranks, 4) ->
      	:four_of_a_kind
      true ->
        :not_matched
    end
  end
end
