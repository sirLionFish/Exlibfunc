defmodule Exlibfunc.Basic.Movie do
  use Ecto.Schema
  alias Exlibfunc.Basic.{Character, Publisher, Actor}

  schema "movies" do
    field :title, :string
    field :tagline, :string
    has_many :characters, Character
    has_one :publisher, Publisher
    many_to_many :actors, Actor, join_through: "movies_actors"
  end
end
