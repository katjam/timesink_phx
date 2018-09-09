# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     TimesinkPhx.Repo.insert!(%TimesinkPhx.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias TimesinkPhx.People.Person
alias TimesinkPhx.Repo

people = [
 %{name: "Maria Coughlin", slackid: "mariac"},
 %{name: "Matthew Slaughter", slackid: "matts"},
 %{name: "Peg Coughlin", slackid: "pegco"}
]

people
|> Enum.each(fn(person) ->
  %Person{} |> Person.changeset(person) |> Repo.insert!
end)
