defmodule Exlibfunc.Libraries.July.FirstWeek do

# ------------level 1----------------
  @doc """
    1.) Make a simple function called greet that welcomes the variable.
  """
  def greet(name), do: "Welcome, #{name}"

  @doc """
    2.) Simple, remove the spaces & exclamation marks from the string, then return the resultant string.
  """
  def removespace(n), do: n |> String.replace(" ", "") |> String.replace("!", "")

  @doc """
    3.) Given a random non-negative number, you have to return the digits of this number within an array in reverse order.
  """
  def reversedigit(n), do: n |> Integer.digits |> Enum.reverse

  @doc """
    4.) Make a function that takes in an integer, separate into individual digits, square them, and then concatnate them.
  """
  def square_digits(n), do: n |> Integer.digits() |> Enum.map_join(&(&1 * &1)) |> String.to_integer()

# ------------level 2----------------

# ------------level 3----------------

end
