defmodule Pokerwars.HandTest do
  use ExUnit.Case, async: true
  alias Pokerwars.Hand
  alias Pokerwars.Card
  doctest Pokerwars.Hand

  @tag :skip
  test "evaluates royal flush of hearts" do
    cards = [
      %Card{rank: 10, suit: :hearts},
      %Card{rank: 11, suit: :hearts},
      %Card{rank: 12, suit: :hearts},
      %Card{rank: 13, suit: :hearts},
      %Card{rank: 14, suit: :hearts}
    ]

    assert Hand.score(cards) == :royal_flush
  end

  @tag :skip
  test "evaluates royal flush of spades" do
    cards = [
      %Card{rank: 10, suit: :spades},
      %Card{rank: 11, suit: :spades},
      %Card{rank: 12, suit: :spades},
      %Card{rank: 13, suit: :spades},
      %Card{rank: 14, suit: :spades}
    ]

    assert Hand.score(cards) == :royal_flush
  end

  @tag :skip
  test "does not evaluate royal flush for mismatching suits" do
    cards = [
      %Card{rank: 10, suit: :diamonds},
      %Card{rank: 11, suit: :diamonds},
      %Card{rank: 12, suit: :diamonds},
      %Card{rank: 13, suit: :clubs},
      %Card{rank: 14, suit: :clubs}
    ]

    assert Hand.score(cards) != :royal_flush
  end

  @tag :skip
  test "evaluates high card" do
    cards = [
      %Card{rank: 2, suit: :spades},
      %Card{rank: 3, suit: :hearts},
      %Card{rank: 5, suit: :diamonds},
      %Card{rank: 7, suit: :spades},
      %Card{rank: 11, suit: :spades}
    ]

    assert Hand.score(cards) == :high_card
  end

  test "returns straight flush" do
    cards = [
      %Card{rank: 7, suit: :clubs},
      %Card{rank: 8, suit: :clubs},
      %Card{rank: 9, suit: :clubs},
      %Card{rank: 10, suit: :clubs},
      %Card{rank: 11, suit: :clubs}
    ]

    assert Hand.score(cards) == :straight_flush
  end

  test "does not return straight flush" do
    cards = [
      %Card{rank: 7, suit: :clubs},
      %Card{rank: 8, suit: :clubs},
      %Card{rank: 9, suit: :clubs},
      %Card{rank: 10, suit: :clubs},
      %Card{rank: 2, suit: :clubs}
    ]

    refute Hand.score(cards) == :straight_flush
  end

  test "straight flush scattered" do
    cards = [
      %Card{rank: 1, suit: :hearts},
      %Card{rank: 3, suit: :hearts},
      %Card{rank: 2, suit: :hearts},
      %Card{rank: 5, suit: :hearts},
      %Card{rank: 4, suit: :hearts}
    ]

    assert Hand.score(cards) == :straight_flush
  end

  test "vaild four of a kind" do
    cards = [
      %Card{rank: 5, suit: :hearts},
      %Card{rank: 5, suit: :spades},
      %Card{rank: 5, suit: :diamonds},
      %Card{rank: 5, suit: :clubs},
      %Card{rank: 3, suit: :diamond},
    ]

    assert Hand.score(cards) == :four_of_a_kind
  end

  test "invaild four of a kind" do
    cards = [
      %Card{rank: 5, suit: :hearts},
      %Card{rank: 5, suit: :spades},
      %Card{rank: 5, suit: :diamonds},
      %Card{rank: 7, suit: :hearts},
      %Card{rank: 3, suit: :diamond},
    ]

    refute Hand.score(cards) == :four_of_a_kind
  end
end

