defmodule QueryDSL do
  # import Ecto.Query, only: [from: 2]

  @doc """
  Set up for user

  Create a query
    query = from u in "users",
            where: u.age > 18,
            select: u.name

  Send the query to the repository
    Repo.all(query)

  iex> query = from u in "users", where: u.age > 0, select: u.name
  iex> query = from u in User, where: u.age 18
  iex> query = from u in query, select: u.city
  iex> query = from q in query, select: q.city
  """
  def user() do
    "Create me a function"
  end

  @doc """
  def with_minimum(age, height_ft) do
    from u in Users,
      where: u.age > ^age and u.height > ^(height_ft * 3.28),
      select: u.name
  end
  """

  def minimum() do
    "make this work"
  end
end
