#couldn't do this lab. Used the Walk Through video https://www.youtube.com/watch?v=rTGdVmzEgW4
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  #instantiates and saves the song, and it returns the new song that was created
  def self.create
    song = self.new
    song.save
    song
  end

  #instantiates a song with a name property
  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    song
  end

  #instantiates and saves a song with a name property
  def self.create_by_name(create_name)
    song = self.create #create instantiates the new object, validates it, and then saves it to the database
    song.name = create_name
    song
  end

  #can find a song present in @@all by name
  #returns falsey when a song name is not present in @@all
  def self.find_by_name(name) #Class Finder -> finds your data
    @@all.find {|song| song.name == name}
  end

  #invokes .find_by_name and .create_by_name instead of repeating code
  #returns the existing Song object (doesn't create a new one) when provided the title of an existing Song
  #creates a new Song object with the provided title if one doesn't already exist
  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
    #the above one is a better way to do the same as:
    #if self.find_by_name(name)
    #   self.find_by_name(name)
    #else
    #   self.create_by_name(name)
    #end
  end

  #returns all the song instances in alphabetical order by song name
  def self.alphabetical
    self.all.sort_by {|song| song.name}
    #self.all.sort_by(&:name) -> equivalent as the code above
  end

  #initializes a song and artist_name based on the filename format
  def self.new_from_filename(filename)
    song = self.new
    split_filename = filename.chomp(".mp3").split(" - ")
    song.artist_name = split_filename [0]
    song.name = split_filename[1]
    song
  end

  #initializes and saves a song and artist_name based on the filename format
  def self.create_from_filename(filename)
    song = self.create
    split_filename = filename.chomp(".mp3").split(" - ")
    song.artist_name = split_filename [0]
    song.name = split_filename[1]
    song
  end

  #clears all the song instances from the @@all array
  def self.destroy_all
    self.all.clear
  end

end
