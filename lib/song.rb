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
    new_song = self.new
    new_song.save
    new_song
  end

  def self.new_by_name(name)
    new_song_with_name = self.new
    new_song_with_name.name = name
    new_song_with_name
  end

  def self.create_by_name(name)
    new_song_with_name = self.create
    new_song_with_name.name = name
    new_song_with_name
  end

  def self.find_by_name(name)
    @@all.detect do |song|
      song.name == name
    end
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by { |song| song.name }
  end

  def self.new_from_filename(filename)
    clean_song = filename
    clean_song[".mp3"]= ""
    song_array = clean_song.split(" - ")

    new_song = self.new
    new_song.artist_name = song_array[0]
    new_song.name = song_array[1]
    new_song
  end

  def self.create_from_filename(filename)
    clean_song = filename
    clean_song[".mp3"]= ""
    song_array = clean_song.split(" - ")
    
    new_song = self.create
    new_song.artist_name = song_array[0]
    new_song.name = song_array[1]
    new_song
  end

  def self.destroy_all
    self.all.clear
  end
end
