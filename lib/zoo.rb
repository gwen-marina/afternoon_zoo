class Zoo

  attr_reader :name, :street, :city, :state, :zip_code, :inventory

  def initialize(name, street, city, state, zip_code)
    @name = name
    @street = street
    @city = city
    @state = state
    @zip_code = zip_code
    @inventory = []
  end

  def address
    "#{street} #{city}, #{state} #{zip_code}"
  end

  def animal_count
    inventory.length
  end

  def add_animal(animal)
    inventory << animal
  end

  def animals_older_than(weeks)
    inventory.select { |animal| animal.age_in_weeks > weeks }
  end

  def total_weight_of_animals
    inventory.sum { |animal| animal.weight_as_integer}
  end

  def details
    { "total_weight" => total_weight_of_animals,
      "street_address" => street }
  end

  def animals_sorted_by_weight
    inventory.sort_by { |animal| -animal.weight_as_integer }
  end

  def animal_hash
    # Hash[@inventory.collect { |animal| [animal.kind[0], animal] } ]

    # animal_hash = Hash.new
    # inventory.each { |animal| animal_hash[animal.first_letter] = [] }
    # inventory.map { |animal| animal_hash[animal.first_letter] = (animal_hash[animal.first_letter] << animal) }
    # animal_hash

    # Maybe a more readable version below

    hash = Hash.new
    inventory.each do |animal|
      first_letter = animal.kind[0]
      if hash[first_letter]
        hash[first_letter] << animal
      else
        hash[first_letter] = [animal]
      end
    end
    hash
  end

end
