# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Exlibfunc.Repo.insert!(%Exlibfunc.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias Exlibfunc.Repo
alias Exlibfunc.Servers.Server
alias Exlibfunc.Games.Manager
alias Exlibfunc.Donations.Donation


Manager.create_game(%{name: "Counter-Strike: Global Offensive", appid: 730})

Manager.create_game(%{name: "Marvel's Spider-Man: Miles Morales", appid: 1817190})

Manager.create_game(%{name: "Tom Clancy: Rainbow Six Siege", appid: 359550})

Manager.create_game(%{name: "Team Fortress 2", appid: 440})

%Server{
  name: "dancing-lizard",
  status: "up",
  deploy_count: 14,
  size: 19.5,
  framework: "Elixir/Phoenix",
  git_repo: "https://git.example.com/dancing-lizard.git",
  last_commit_id: "f3d41f7",
  last_commit_message: "If this works, I'm going disco    🕺"
}
|> Repo.insert!()

%Server{
  name: "lively-frog",
  status: "up",
  deploy_count: 12,
  size: 24.0,
  framework: "Elixir/Phoenix",
  git_repo: "https://git.example.com/lively-frog.git",
  last_commit_id: "d2eba26",
  last_commit_message: "Does it scale? 🤔"
}
|> Repo.insert!()

%Server{
  name: "curious-raven",
  status: "up",
  deploy_count: 21,
  size: 17.25,
  framework: "Ruby/Rails",
  git_repo: "https://git.example.com/curious-raven.git",
  last_commit_id: "a3708f1",
  last_commit_message: "Fixed a bug! 🐞"
}
|> Repo.insert!()

%Server{
  name: "cryptic-owl",
  status: "down",
  deploy_count: 2,
  size: 5.0,
  framework: "Elixir/Phoenix",
  git_repo: "https://git.example.com/cryptic-owl.git",
  last_commit_id: "c497e91",
  last_commit_message: "First big launch! 🤞"
}
|> Repo.insert!()


donation_items = [
  "Coffee",
  "Milk",
  "Beef",
  "Chicken",
  "Pork",
  "Turkey",
  "Potatoes",
  "Cereal",
  "Oatmeal",
  "Eggs",
  "Bacon",
  "Cheese",
  "Lettuce",
  "Cucumber",
  "Smoked Salmon",
  "Tuna",
  "Halibut",
  "Broccoli",
  "Onions",
  "Oranges",
  "Honey",
  "Sourdough Bread",
  "French Bread",
  "Pear",
  "Nuts",
  "Apples",
  "Coconut",
  "Butter",
  "Mozzarella",
  "Tomatoes",
  "Mushrooms",
  "Rice",
  "Pasta",
  "Banana",
  "Carrots",
  "Lemons",
  "Watermelons",
  "Grapes",
  "Strawberries",
  "Melons",
  "Cherries",
  "Peaches",
  "Pineapples",
  "Kiwis",
  "Eggplants",
  "Avocados",
  "Peppers",
  "Corn",
  "Sweet Potatoes",
  "Bagels",
  "Soup",
  "Cookies"
]

for _i <- 1..12 do
  item = Enum.random(donation_items)

  %Donation{
    item: item,
    quantity: Enum.random(1..20),
    days_until_expires: Enum.random(1..30)
  }
  |> Repo.insert!()
end
