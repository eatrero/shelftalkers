defmodule Shelftalkers.TalkerView do
  use Shelftalkers.Web, :view
  def render("index.json", %{talkers: talkers}) do
    %{
      count: talkers.count,
      talkers: Enum.map(talkers.talkers, &talker_json/1)
    }
  end

  def talker_json(talker) do
    %{
      id: talker.id,
      brewer: talker.brewer,
      style: talker.style,
      name: talker.name,
      description: talker.description,
      abv: talker.abv,
      rating: talker.rating,
      barcode: talker.barcode,
      beer: talker.beer,
      location: talker.location,
      sku: talker.sku
    }
  end
end
