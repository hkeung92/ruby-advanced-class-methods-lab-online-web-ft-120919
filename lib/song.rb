class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
  
  def self.create
    song = self.new 
    self.all << song
    song
  end
  
  def self.new_by_name(name)
    song = self.new
    song.name = name 
    song 
  end
  
  def self.create_by_name(name)
    song = self.create
    song.name = name
    song
  end
  
  def self.find_by_name(name)
    result = self.all.detect{|song| song.name == name}
    result
  end
  
  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end
  
  def self.alphabetical
    @@all.sort_by{|song| song.name}
  end
  
  def self.new_from_filename(filename)
    row = filename
    data = row.split(" - ")
    artist_name = data[0]
    song_name = data[1].chomp(".mp3")
    
    song = self.new 
    song.name = song_name 
    song.artist_name = artist_name
    song
  end
  
  def self.create_from_filename(filename)
<<<<<<< HEAD
    # result = self.create_from_filename(filename)
    # song = self.create
    # song.name = result.name
    # song.artist_name = result.artist_name
    # song
    song = self.new
    song.name = (filename.split(" - ")[1].chomp(".mp3"))
    song.artist_name = (filename.split(" - ")[0])
    @@all << song
    song
  end
  def self.destroy_all
    self.all.clear
  end
=======
    song = self.create_from_filename(filename)
    song.save
    song
  end
>>>>>>> 134911d7827cb7cfaa8c1e17941e948c7358d852
end
