defmodule TimesinkPhx.People.Person do
  use Ecto.Schema
  import Ecto.Changeset


  schema "people" do
    field :name, :string
    field :slackid, :string

    timestamps()
  end

  @doc false
  def changeset(person, attrs) do
    person
    |> cast(attrs, [:name, :slackid])
    |> validate_required([:name, :slackid])
  end
end
