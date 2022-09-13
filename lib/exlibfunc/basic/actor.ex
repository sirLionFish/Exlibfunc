defmodule Exlibfunc.Basic.Actor do
  use Ecto.Schema

  schema "actors" do
    field :name, :string
    many_to_many :movies, Exlibfunc.Basic.Actor, join_through: "movie_actors"
  end
end
