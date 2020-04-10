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

  def self.find_by_name(name)
    self.all.find {|artist| artist.name == name }
  end

  def self.find_or_create_by_name(name)
    found_artist = self.all.find {|artist| artist.name == name}
      if found_artist
        found_artist
    else
      self.new(name)
    end
  end

  def artist=(name)
    self.artist = Artist.find_or_create_by_name(name)
    artist.add_song(self)
  end


end
