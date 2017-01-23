defmodule Shelftalkers.TalkerView do
  use Shelftalkers.Web, :view
  def render("index.json", %{talkers: talkers}) do
    %{
      talkers: Enum.map(talkers, &talker_json/1)
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
      rating: talker.rating
    }
  end
end
