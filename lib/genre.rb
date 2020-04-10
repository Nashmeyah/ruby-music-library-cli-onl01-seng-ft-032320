class Genre
  attr_accessor :name, :artist, :song,:songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
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

  def self.create(genre)
    genre = Genre.new(genre)
    genre.save
    genre
  end


  # def artists
  #  songs.map {|i| i.artist}
  # end

end
