require "pry"

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
    @@all << self.new
    @@all[-1]
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    #returns a song instance with the name set to the name preperty. Saves the song.
    song = self.create
    song.name = name
    song
  end

  def self.find_by_name(name)
    self.all.find {|song| name == song.name}
    
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(file_name)
    song_info = file_name.split(" - ")
    artist = song_info[0]
    song_mp3 = song_info[1]
    song_split = song_mp3.split(".")
    song_title = song_split[0]
    new_song = self.new
    new_song.name = song_title
    new_song.artist_name = artist
    new_song
  end

  def self.create_from_filename(file_name)
    song_info = file_name.split(" - ")
    artist = song_info[0]
    song_mp3 = song_info[1]
    song_split = song_mp3.split(".")
    song_title = song_split[0]
    new_song = self.new
    new_song.name = song_title
    new_song.artist_name = artist
    @@all << new_song
  end

  def self.destroy_all
    self.all.clear
  end
end
