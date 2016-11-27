class Stat
  def perform
    countries = CountriesFetcher.new(ARGV).perform
    compared_data = Comparator.new(countries).perform
    Printer.new.perform(compared_data)
  end

  private
  attr_accessor :countries_fetcher
end
