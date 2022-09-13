defmodule Exlibfunc.Basic.Character do
  use Ecto.Schema
  alias Exlibfunc.Basic.Movie

  schema "characters" do
    field :name, :string
    belongs_to :movie, Movie
  end
end
