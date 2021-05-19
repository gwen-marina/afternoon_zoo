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

end
