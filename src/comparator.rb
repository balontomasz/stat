class Comparator
  def initialize(countries)
    @object_1, @object_2 = countries
  end

  def perform
    {
      object_1: object_1,
      object_2: object_2,
      diff: {
        rate: rate
      }
    }
  end

  private

  attr_reader :object_1, :object_2

  def rate
    object_1.rate - object_2.rate
  end
end
