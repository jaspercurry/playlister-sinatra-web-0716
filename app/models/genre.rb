class Genre <ActiveRecord::Base
  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs

  def slug
    self.name.slugify
  end

  def self.find_by_slug(slug)
    slug = slug.split("-")
    caps = slug.map do |item|
      item.capitalize
    end.join(" ")
    Genre.find_by(name: caps)
  end

end
