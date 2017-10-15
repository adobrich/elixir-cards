defmodule Cards do
  @moduledoc """
  Provides methods for creating and handling a deck of cards
  """

  @doc """
  Returns a list of tuples `{rank, suit}` representing a deck of 52 playing
  cards

  ## Examples

      iex> deck = Cards.create_deck()
      iex> List.first(deck)
      {2, "Spades"}
      iex> List.last(deck)
      {"A", "Hearts"}

  """
  def create_deck do
    ranks = Enum.to_list(2..10) ++ ~w(J Q K A)
    suits = ~w(Spades Diamonds Clubs Hearts)
    for suit <- suits, rank <-ranks do
      {rank, suit}
    end
  end

  @doc """
  Shuffles a deck.

  ## Examples

      iex> deck = Cards.create_deck()
      iex> shuffled_deck = Cards.shuffle(deck)
      iex> shuffled_deck !== deck
      true

  """
  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  @doc """
  Takes `n` cards from the top of the deck.

  ## Examples

      iex> deck = Cards.create_deck()
      iex> {hand, rest} = Cards.take(deck, 5)
      iex> length(hand) == 5 && length(rest) == 47
      true

  """
  def take(deck, number) do
    Enum.split(deck, number)
  end

  @doc """
  Returns `true` if the collection of cards contains the supplied card. `false`
  otherwise.

  ## Examples

      iex> deck = Cards.create_deck()
      iex> {hand, _rest} = Cards.take(deck, 5)
      iex> Cards.contains?(hand, {2, "Spades"})
      true

  """
  def contains?(deck, card) do
    Enum.member?(deck, card)
  end
end
