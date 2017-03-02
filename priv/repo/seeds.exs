# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Shelftalkers.Repo.insert!(%Shelftalkers.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

# Shelftalkers.Repo.insert!(%Shelftalkers.Talker{
#   abv: 5.3, 
#   brewer: "Belching Beaver",
#   description: "This beer is refreshingly smooth, tasting of roasted coffee, chocolate and peanut butter. Brewed with rolled oats and lactose, this beer has a silky-smooth mouth-feel finish. Don’t let the color fool you. This dark beer is easy-drinking.",
#   name: "Peanut Butter Milk Stout",
#   rating: 95.0, 
#   style: "Sweet Stout"})

# Shelftalkers.Repo.insert!(%Shelftalkers.Talker{
#   abv: 10.0, 
#   brewer: "Ballast Point",
#   description: " Victory at Sea Imperial Porter is a bold, smooth brew with just the right amount of sweetness. We infused this robust porter with whole vanilla beans and San Diego’s own Caffe Calabria coffee beans. The subtle roasted notes and minimal acidity of the cold brewed coffee, balances perfectly with the sweet caramel undertones of the malt, creating a winning combination for your palate.",
#   name: "Victory at Sea",
#   rating: 97.0, 
#   style: "Imperial Porter"})

# Shelftalkers.Repo.insert!(%Shelftalkers.Talker{
#   abv: 11.0, 
#   brewer: "Russian River Brewing",
#   description: "Pliny the Younger was Pliny the Elder’s nephew, in the case of this beer, the \"Younger\" is a triple IPA. Pliny the Younger is hopped three times more than our standard IPA, and is dry hopped four different times.",
#   name: "Pliny The Younger",
#   rating: 100.0, 
#   style: "Imperial IPA"})

# Shelftalkers.Repo.insert!(%Shelftalkers.Talker{
#   abv: 7.9, 
#   brewer: "Monkey Paw Pub and Brewery",
#   description: "This is no IPA. This is a San Diego Pale Ale. How did we get here? Easy! Take out the sweet caramel malt backbone and intense bittering of classic IPAs and replace them with a light biscuity malt profile and intense flavor and aroma hop additions. We then dry hop the bejesus out of it and get it out as fresh as possible. Be careful, this 7.9% ABV beer drinks like a pale ale and that’s how we like it in America’s Finest Beer City.",
#   name: "Bonobos",
#   rating: 96.0, 
#   style: "IPA"})

# Shelftalkers.Repo.insert!(%Shelftalkers.Talker{
#   abv: 10.0, 
#   brewer: "Russian River",
#   description: "When we made the Toronado’s 20th Anniversary Ale, we had no idea that it would turn out to be one of our favorite barrel aged beers we would ever make. With that said, we have always wanted to make a dark barrel aged beer using 100% Cabernet Sauvignon barrels but, we never were inspired. That is, until we blended five different beers to make the Toronado beer, the tobacco character from the the dark malts blended nicely with the furit character that developed in blending. So, with Concescration we set out to make a barrel beer using all Cabernet Sauvignon barrels. No, we are not saying that this is a replica of the T-rooms anniversary beer, after all, a beer like that can never be duplicated, and, there was no fruit added to that beer as there is with this one. All we are saying is that it gave us great inspiration to brew Consecration.",
#   name: "Consecration",
#   rating: 100.0, 
#   style: "Sour Red/Brown"})

defmodule Seed 
  use Ecto.Migration

  def run do
    "./priv/repo/merged.csv" 
      |> File.stream! 
      |> NimbleCSV.parse_stream 
      |> Stream.map(fn [abv,barcode,beer,brewer,description,location,name,sku,style ] -> 
        %{abv: abv, barcode: barcode, beer: beer, brewer: brewer, location: location, 
        name: name, sku: sku, style: style, description: description} end)
      |> Enum.map(fn (row) -> Shelftalkers.Repo.insert!(struct(Shelftalkers.Talker, row)) end)
  end
end