class Song
  attr_accessor :name,:artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    self.class.all << self
  end

  def self.create(song)
    song = Song.new(song)
    song.save
    song
  end

  def find_by_name(name)
    @@all.find {|artist| artist.name == name }
  end

end
