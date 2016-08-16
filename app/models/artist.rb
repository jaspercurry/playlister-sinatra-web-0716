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
      item.downcase
    end.join(" ")
      Artist.all.each do |artist|
        
        if artist.name.downcase == caps
          return artist
        end
      end
  end

end
