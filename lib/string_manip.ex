require Integer
require String

defmodule StringManip do
  @moduledoc """
  Documentation for StringManip.
  """

  def upcase(input) do
    String.upcase(input)
  end

  def reverse(input) do
    String.reverse(input)
  end

  def split(input) do
    String.split(input, " ") 
  end

  def upcase_reverse_split(input) do
    split(
      reverse(
        upcase(input)
      )
    )
  end

  @doc """
  iex> StringManip.middle("abcde")
  "c"

  iex> StringManip.middle("ab")
  ""

  iex> StringManip.middle("")
  ""
  """
  def middle(input) do
    if Integer.is_odd(String.length(input)),
      do: String.at(input, floor(String.length(input) / 2)),
      else: ""
  end

  @doc """
  iex> StringManip.l_half("abc")
  "a"

  iex> StringManip.l_half("abcd")
  "ab"

  iex> StringManip.l_half("")
  ""
  """
  def l_half(input) do
    String.slice(input, 0..(floor(String.length(input) / 2) - 1))
  end

  @doc """
  iex> StringManip.r_half("abc")
  "c"

  iex> StringManip.r_half("abcd")
  "cd"

  iex> StringManip.r_half("")
  ""
  """
  def r_half(input) do
    String.slice(input, -(floor(String.length(input) / 2))..-1)
  end

  @doc """
  Takes a string, and moves the most inner characters to the outer most position.

  Examples:
  iex> StringManip.inside_out("abcde")
  "baced"

  iex> StringManip.inside_out("abcdef")
  "cbafed"

  iex> StringManip.inside_out("")
  ""

  Notice that in a string with an odd number of characters, the middle character
  does not change position, but the characters nearest the center get flipped to
  the outside such that they are now the outermost character.

  In a string with an even number of characters, since no character is right in
  the center, all characters will change position.
  """
  def inside_out(input) do
    reverse(l_half(input)) <> middle(input) <> reverse(r_half(input))
  end
end
