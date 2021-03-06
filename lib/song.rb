class Song 
attr_accessor :name, :artist
@@all = []
  def initialize(name)
    @name = name
    @@all << self
  end
  
  def self.all
    @@all
  end

  def self.new_by_filename(file)
   song_name = file.split(" - ")[1]
   artist = file.split(" - ")[0]
   song = self.new(song_name)
   song.artist = Artist.new(artist)
   song
  end
  
  def artist_name=(artist)
    #puts artist
    artist = Artist.find_or_create_by_name(artist)
    artist.add_song(self)
    #puts artist
    #puts Artist.all
  end
end