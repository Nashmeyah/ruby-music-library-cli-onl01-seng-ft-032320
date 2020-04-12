class MusicLibraryController
    def initialize(path = "./db/mp3s")
        @path = path
        m_i = MusicImporter.new(path)
        m_i.import 
    end

    def call
        
        puts "Welcome to your music library!"
        puts "To list all of your songs, enter 'list songs'."
        puts "To list all of the artists in your library, enter 'list artists'."
        puts "To list all of the genres in your library, enter 'list genres'."
        puts "To list all of the songs by a particular artist, enter 'list artist'."
        puts "To list all of the songs of a particular genre, enter 'list genre'."
        puts "To play a song, enter 'play song'."
        puts "To quit, type 'exit'."
        puts "What would you like to do?"

        input = gets.strip.downcase
        while input != "exit"
            if input == "list songs"
                list_songs
            elsif input == "list artists"
                list_artists
            elsif input == "list genres"
                list_genres
            elsif input == "list artist"
                list_songs_by_artist
            elsif input == "list genre"
                list_songs_by_genre
            elsif input == "play song"
                play_song
            else 
                puts "Bye"
                
            end
            input = gets.strip.downcase
        end
        
    end

      def list_songs
        Song.all.sort{|a, b| a.name <=> b.name}.each_with_index do |s, i|
          puts "#{i+1}. #{s.artist.name} - #{s.name} - #{s.genre.name}"
        end
      end

      def list_artists
        Artist.all.sort{|a, b| a.name <=> b.name}.each_with_index do |a, i|
          puts "#{i+1}. #{a.name}"
        end
      end

      def list_genres
        Genre.all.sort{|a, b| a.name <=> b.name}.each_with_index do |g, i|
          puts "#{i+1}. #{g.name}"
        end
      end

      def list_songs_by_artist
        puts "Please enter the name of an artist:"
        input = gets.strip
        s_list =Song.all.select {|song| song.artist.name == input}
        s_list.sort_by! {|song| song.name}
        s_list.each.with_index(1) do |s,i|
        puts "#{i}. #{s.name} - #{s.genre.name}"
        end
      end

      def list_songs_by_genre
        puts "Please enter the name of a genre:"
        input = gets.strip
        s_list = Song.all.select {|song| song.genre.name == input}
        s_list.sort_by! {|song| song.name}
        s_list.each.with_index(1) do |s,i|
        puts "#{i}. #{s.artist.name} - #{s.name}"
        end
      end

      def play_song#----not finished
        puts "Which song number would you like to play?"
        input = gets.strip.to_i
        if(1...Song.all.length).include?(input)
            song = Song.all.sort{|a,b| a.name <=> b.name}[input-1]
        puts "Playing #{song.name} by #{song.artist.name}" if song
        end
     end
end