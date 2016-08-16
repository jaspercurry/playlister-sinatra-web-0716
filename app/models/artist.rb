class Artist <ActiveRecord::Base
  has_many :songs
  # has_many :song_genres
  has_many :genres, through: :songs

  def slug
    self.name.slugify
  end

  def self.find_by_slug(slug)
    slug = slug.split("-")

    caps = slug.map do |item|
      item.capitalize
    end.join(" ")

    Artist.find_by(name: caps)

  end

  #   Artist.find_by(name: )
  #
  # describe "Class methods" do
  #   it "given the slug can find an Artist" do
  #     slug = "taylor-swift"
  #     expect((Artist.find_by_slug(slug)).name).to eq("Taylor Swift")
  #   end

end
