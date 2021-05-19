class Zoo

  attr_reader :name, :street, :city, :state, :zip_code, :inventory, :animal_count

  def initialize(name, street, city, state, zip_code)
    @name = name
    @street = street
    @city = city
    @state = state
    @zip_code = zip_code
    @inventory = []
    @animal_count = 0
  end

  def address
    street + " " + city + ", " + state + " " + zip_code
  end

  def add_animal(animal)
    inventory << animal
    @animal_count +=1
  end

  def animals_older_than(weeks)
    inventory.select { |animal| animal.age_in_weeks > weeks }
  end

  def details
    { "total_weight" => inventory.sum { |animal| animal.weight_as_integer} ,
      "street_address" => street }
  end

end
