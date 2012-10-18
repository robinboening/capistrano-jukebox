require 'capistrano'

module Capistrano::Jukebox

  def self.load_into(configuration)

    configuration.load do

      # Start playing music before :deploy
      on :before, :only => :deploy do
        file = configuration[:file]
        file = jeopardy_song if file.nil?
        start_playing(file)
      end

      # Stop playing music after :deploy
      on :after, :only => :deploy do
        stop_playing
      end

      # Jukebox start/stop cap tasks
      namespace :jukebox do
        desc 'Start playing music on the jukebox'
        task :play, :roles => :app, :except => {:no_release => true} do
          file = configuration[:file]
          file = jeopardy_song if file.nil?
          start_playing(file)
        end

        desc 'Stop the jukebox from playing music'
        task :stop, :roles => :app, :except => {:no_release => true} do
          puts "You have forced the jukebox to stop the music."
          stop_playing
        end
      end

      # Starting mplayer playing the file in the background
      def start_playing(file)
        puts "Jukebox is starting to play '#{file}'"
        @pid = fork do
          exec("mplayer #{file} -really-quiet -framedrop -cache 16384 -cache-min 20/100")
        end
      end

      # Stops mplayer by killing it by pid
      # If no pid is known, all running player processes are killed
      def stop_playing
        unless @pid.nil?
          ::Process.kill("TERM", @pid)
        else
          exec("killall mplayer")
        end
      end

      def jeopardy_song
        File.expand_path('../../../music/jeopardy_thinking.mp3', __FILE__)
      end

    end

  end

end

if Capistrano::Configuration.instance
  Capistrano::Jukebox.load_into(Capistrano::Configuration.instance)
end
