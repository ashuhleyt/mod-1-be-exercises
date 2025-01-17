class Curator 
  attr_reader :photographs, :artists

  def initialize 
    @photographs = []
    @artists = []
  end

  def add_photograph(photo)
    @photographs << photo
  end

  def add_artist(artist)
    @artists << artist
  end

  def find_artist_by_id(id)
    @artists.find { |artist| artist.id == id }
  end

  def photographs_by_artist
    result = {}
    @artists.each do |artist|
      artist_photos = @photographs.select { |photo| photo.artist_id == artist.id }
      result[artist] = artist_photos
    end
    result
  end
end