class Printer
  def perform(data)
    obj1 = data.fetch(:object_1)
    obj2 = data.fetch(:object_2)
    diff = data.fetch(:diff)


    print_header
    print_data(obj1, obj2)
    print_diff(diff)
  end

  private

  def print_header
    puts "Oto moje perfekcyjne zajebiste dane ktore przedstawiaj sie nastepujaco:"
  end

  def print_data(o1, o2)
    puts "name: #{o1.name} ma: #{o1.rate}"
    puts "name: #{o2.name} ma: #{o2.rate}"
  end

  def print_diff(diff)
    puts "Różnica pomiędzy PKB per capita wynosi: #{diff.fetch(:rate)}"
    puts "Stosunek PKB per capita wynosi: #{diff.fetch(:ratio)}"
  end
end
