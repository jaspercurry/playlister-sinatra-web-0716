class Song <ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres

  def slug
    self.name.slugify
  end

  def self.find_by_slug(slug)
    slug = slug.split("-")
    caps = slug.map do |item|
      item.capitalize
    end.join(" ")
    Song.find_by(name: caps)
  end

end
