class Genre

  attr_reader :name

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def new_song(name, artist)
    Song.new(name, artist, self)
  end

  def songs
    Song.all.select do |song_obj|
      song_obj.genre == self
    end
  end

  def artists
    self.songs.map do |song_obj|
      song_obj.artist
    end
  end
end
