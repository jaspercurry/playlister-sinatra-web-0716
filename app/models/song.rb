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
      item.downcase
    end.join(" ")
      Song.all.each do |song|
        if song.name.downcase == caps
          return song
        end
      end
  end

end
