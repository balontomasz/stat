require 'pry'
Dir["./src/*.rb"].each {|file| require file }

class Run
  def perform(args)
    if args.count == 2
      Stat.new.perform
    else
      puts "invalid number of arguments!"
    end
  end
end

Run.new.perform(ARGV)
