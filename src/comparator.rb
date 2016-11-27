class Comparator
  def initialize(countries)
    @object_1, @object_2 = countries
  end

  def perform
    {
      object_1: object_1,
      object_2: object_2,
      diff: {
        rate: rate,
        ratio: ratio
      }
    }
  end

  private

  attr_reader :object_1, :object_2

  def rate
    object_1.rate - object_2.rate
  end

  def ratio
    (object_1.rate.to_f / object_2.rate.to_f).round(2)
  end
end
