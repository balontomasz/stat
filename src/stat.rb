require 'pry'
Dir["./src/*.rb"].each {|file| require file }

class Stat
  def run
    name_a = "Poland"
    name_b = "Spain"

    countries = CountriesFetcher.new.perform
    countries = countries.select { |c| c.name == name_a || c.name == name_b }
    compared_data = Comparator.new(countries).perform
    binding.pry

  end

  private
  attr_accessor :countries_fetcher
end

Stat.new.run
