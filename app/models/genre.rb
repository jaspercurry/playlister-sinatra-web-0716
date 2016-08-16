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
      item.downcase
    end.join(" ")
      Genre.all.each do |genre|

        if genre.name.downcase == caps
          return genre
        end
      end
  end

end
