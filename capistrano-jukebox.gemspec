# encoding: utf-8
$:.push File.expand_path("../lib", __FILE__)
require "capistrano/jukebox/version"

Gem::Specification.new do |s|
  s.name        = 'capistrano-jukebox'
  s.version     = CapistranoJukebox::VERSION.dup
  s.platform    = Gem::Platform::RUBY
  s.license     = 'MIT'
  s.author      = 'Robin Böning'
  s.email       = 'rb@magiclabs.de'
  s.homepage    = 'https://github.com/robinboening/capistrano-jukebox'
  s.summary     = %q{A Jukebox playing music while deployment with Capistrano}
  s.description = %q{Sometimes deployment takes long time... You need some amusement!}
  s.requirements << 'MPlayer (http://www.mplayerhq.hu)'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency 'capistrano'
end
