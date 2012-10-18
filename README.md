capistrano-jukebox
==================

Sometimes deployment takes long time... We need some amusement!

Installation
------------

    gem install capistrano-jukebox
  
    # config/deploy.rb
    require "capistrano/jukebox"


Usage
-----

__When you type `cap deploy` the jukebox starts to play automatically and stops when the deployment has finished.__

For playing "Jeopardy think music"

    cap deploy

For playing your own file

    cap deploy -s file=http://domain.com/my_music.mp3


__You can also use the cap tasks manually to start/stop music__

For playing "Jeopardy think music"

    cap jukebox:play

For playing your own file

    cap jukebox:play -s file=http://domain.com/my_music.mp3

Dependencies
------------

MPlayer (http://www.mplayerhq.hu/design7/info.html)

OSX Installation:

    brew install mplayer