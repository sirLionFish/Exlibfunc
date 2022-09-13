defmodule Exlibfunc.Basic.Person do
  use Ecto.Schema
  import Ecto.Changeset

  schema "people" do
    field :name, :string
    field :age, :integer, default: 0
  end

  @doc """
  %Exlibfunc.Basic.Person{name: name, age: age}

  ^^^ Simple Input ^^
  """

  def changeset(struct, params) do
    struct
    |> cast(params, [:name, :age])
    |> validate_required([:name, :age])
    |> validate_length(:name, min: 2)
    |> no_no_words()
  end

  @doc """
  Exlibfunc.Basic.Person.changeset(%Exlibfunc.Basic.Person{},%{"name" => "Anon"})

  ^^^ This should return an error. ^^^
  """

  @banned_names ["Anons"]
  def no_no_words(changeset) do
    name = get_field(changeset, :name)

    if name in @banned_names do
      add_error(changeset, :name, "Grow up pls")
    else
      changeset
    end
  end

  def set_anon(changeset) do
    name = get_field(changeset, :name)

    if is_nil(name) do
      put_change(changeset, :name, "Anon")
    else
      changeset
    end
  end

  @doc """
  Exlibfunc.Basic.Person.registration(%Exlibfunc.Basic.Person{}, %{})

  ^^^ Should be the working function. ^^^
  """

  def registration(struct, params) do
    struct
    |> cast(params, [:name, :age])
    |> set_anon()
  end
end
