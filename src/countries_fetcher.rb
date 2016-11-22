class CountriesFetcher
  def perform
    [
      Country.new(name: "Poland", rate: 1),
      Country.new(name: "Germany", rate: 2),
      Country.new(name: "England" ,rate: 3),
      Country.new(name: "Spain", rate: 4),
    ]
  end
end
