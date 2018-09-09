defmodule TimesinkPhxWeb.PersonView do
  use TimesinkPhxWeb, :view
  alias TimesinkPhxWeb.PersonView

  def render("index.json", %{people: people}) do
    %{data: render_many(people, PersonView, "person.json")}
  end

  def render("show.json", %{person: person}) do
    %{data: render_one(person, PersonView, "person.json")}
  end

  def render("person.json", %{person: person}) do
    %{id: person.id,
      name: person.name,
      slackid: person.slackid}
  end
end
