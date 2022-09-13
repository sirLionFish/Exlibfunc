defmodule Exlibfunc.Basic.Publisher do
  use Ecto.Schema
  alias Exlibfunc.Basic.Movie

  schema "publishers" do
    field :name, :string
    belongs_to :movie, Movie
  end
end
