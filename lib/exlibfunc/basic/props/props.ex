defmodule Props do
  @doc """
  return here: https://hexdocs.pm/ecto/Ecto.Query.html#module-query-expressions
  """
  def sloppy() do
    "Don't get sloppy bc iex.exs"
  end

  @doc """
  Set up for simple struct

  iex> movie = %Movie{title: "title", tagline: "tagline"}
  iex> movie = Repo.insert!(movie)
  """
  def movie() do
    "Create me a function"
  end

  @doc """
  Build association chatacter and insert into database

  iex> character = Ecto.build_assoc(movie, :characters, %{name: "Wade Wilson"})
  iex> Repo.insert!(character)
  """
  def character() do
    "Create me a function"
  end

  @doc """
  Build association publisher and insert into database

  iex> pub = Ecto.build_assoc(movie, :publisher, %{name: "Netflix"})
  iex> Repo.insert!(pub)
  """

  def publisher() do
    "Create me a function"
  end

  @doc """
  The build_assoc/3 approach won’t work for our many-to-many relationship.
  That is because neither the movie nor actor tables contain a foreign key.
  Instead, we need to leverage Ecto Changesets and the put_assoc/4 function.

  iex> actor = %Actor{name: "Tyler Oncely"}
  iex> actor = Repo.insert!(actor)
  """
  def actor() do
    "Create me a function"
  end

  @doc """
  Will need to preload movie so that actor knows where to go;
  Define a changeset for movie

  iex> movie = Repo.preload(movie, [:publisher, :characters, :actors])
  iex> movie_changeset = Ecto.Changeset.change(movie)
  iex> movie_actors_changeset = movie_changeset
                                |> Ecto.Changeset.put_asscoc(:actors, [actor])
  iex> Repo.update!(movie_actors_changeset)
  iex> actor_changeset = movie_changeset
                        |> Ecto.Changeset.put_assoc(:actors, [%[name: "Bill"]])

  """
  def preload() do
    "Create me a function"
  end

  @doc """
  Repo get allows to grab entity from data based on id

  iex> Repo.get(Movie, 1)
  """
  def get() do
    "Create me a function"
  end

  @doc """
  iex> Repo.get_by(Movie, title: "title")
  """
  def get_by() do
    "Create me a function"
  end

  @doc """
  We can create a query with the Ecto.Query.from/2 macro.
  This function takes in two arguments: an expression and an optional keyword list.

  iex> query = from(Movie)
  iex> Repo.all(query)
  """
  def ecto_query() do
    "Create me a function"
  end

  @doc """
  Bindingless Queries
  The most fun parts of SQL statements.

  iex> query = from(Movie, where: [title: "title"], [:title, :tagline])
  iex> Repo.all(query)

  """
  def bindingless_query() do
    "Create me a function"
  end

  @doc """
  we call m a binding. Bindings are extremely useful,
  because they allow us to reference modules in other parts of the query.
  Let’s select titles of all movies that have id less than 2:

  iex> query = from(m in Movie)
  iex> query = from(m in Movie, where: m.id < 2, select: m.title)
  iex> Repo.all(query)
  """
  def in_expression() do
    "Create me a function"
  end

  @doc """
  Macro Query

  iex> query = select(Movie, [m], m.title)
  iex> Repo.all(query)

  vvv Is the same as vvv

  iex> Movie
  ...> |> where([m], m.id <2)
  ...> |> select([m], {m.title})
  ...> |> Repo.all

  """
  def maro_q() do
    "Create me a function"
  end

  @doc """
  In order to use interpolated values or Elixir expressions in our where clauses,
  we need to use the ^, or pin, operator.
  This allows us to pin a value to a variable and refer to that pinned value,
  instead of re-binding that variable.

  iex> title = "Readme"
  iex> query = from(m in Movie, where: m.title == ^title, select: m.tagline)
  iex> Repo.all(query)

  """
  def interpolate() do
    "Create me a function"
  end


  @doc """
  Preload with one query

  iex> query = from(m in Movie, join: a in assoc(m, :actors), preload: [actor: a])
  iex> Repo.all(query)

  """
  def one_q() do
    "Create me a function"
  end

  @doc """
  Preload with two queries

  iex> Repo.all(from m in Movie, preload: [:actors])
  """
  def two_q() do
    "Create me a function"
  end

  @doc """
  Preload fetch record
  preload the associated schemas of records that have already been queried from the database.

  iex> movie = Repo.get(Movie, 1)
  iex> movie = Repo.preload(movie, :actors)
  iex> movie.actors
  """
  def fetched_records() do
    "Create me a function"
  end

  @doc """
  execute queries that include join statements
  with the help of the Ecto.Query.join/5 function.

  iex> query = from m in Movie,
               join: c in Character,
               on: m.id == c.movie_id,
               where: c.name == "Bob Odenkirk",
               select: {m.title, c.name}
  """
  def join_statments() do
    "Create me a function"
  end

  @doc """
  The on expression can also use a keyword list:

  iex> query = from m in Movie,
               join: c in Character,
               on: [id: c.movie_id],
               where: c.name == "Bob Odenkirk",
               select: {m.title, c.name}
  """
  def keyword_list() do
    "Create me a function"
  end

  @doc """
  create a new column name stars and query it

  ies> movies = from m in Movie, where: [stars: 5]
  iex> query = from c in Character,
               join: ^movies,
               on: [id: c.movie_id],
               where: c.name == "Bob Odenkirk",
               select: {m.title, c.name}
  """
  def stars() do
    "Create me a function"
  end
end
