class Song
  attr_reader :name, :artist, :duration

  def initialize(name, artist, duration)
    @name = name
    @artist = artist
    @duration = duration
  end

  def play
    puts "Playing '#{name}' by #{artist} (#{duration} mins)..."
  end
end

song_1 = Song.new('Wild Blue','John Mayer', 3)
song_2 = Song.new('Song 2','Blur', 2)
song_3 = Song.new('The Magic Number','De La Soul', 3)

class Playlist
  def initialize(name)
    @name = name
    @songs = []
  end

  def add_song(song)
    @songs << song
  end

	def each
		@songs.each { |song| yield song }
	end
end

my_playlist = Playlist.new('epic list')

my_playlist.add_song(song_1)
my_playlist.add_song(song_2)
my_playlist.add_song(song_3)

my_playlist.each {|song| song.play}