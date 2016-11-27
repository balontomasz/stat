require 'net/http'
require 'json'

class CountriesFetcher
  def initialize(countries_labels)
    @countries_labels = countries_labels
  end

  def perform
    response = Net::HTTP.get(url)
    data = JSON.parse(response)
    index_country_1 = index_for_country(data, @countries_labels.first)
    index_country_2 = index_for_country(data, @countries_labels.last)

    coutry_data_1 = data_for_country(data, index_country_1)
    coutry_data_2 = data_for_country(data, index_country_2)

    [
      Country.new(name: @countries_labels.first, rate: coutry_data_1),
      Country.new(name: @countries_labels.last, rate: coutry_data_2)
    ]
  end

  private

  attr_reader :countries_labels

  def url
    URI("http://ec.europa.eu/eurostat/wdds/rest/data/v2.1/json/en/" \
    "tec00001?precision=1&geo=#{countries_labels.first}&" \
    "geo=#{countries_labels.last}&na_item=B1GQ&" \
    "lastTimePeriod=1&unit=CP_EUR_HAB&unitLabel=label")
  end

  def index_for_country(data, label)
    data
      .fetch("dimension", {})
      .fetch("geo", {})
      .fetch("category", {})
      .fetch("index", {})
      .fetch(label)
  end

  def data_for_country(data, index)
    data
    .fetch("value", {})
    .fetch(index.to_s)
  end
end
