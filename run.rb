require 'pry'
Dir["./src/*.rb"].each {|file| require file }

Stat.new.run
