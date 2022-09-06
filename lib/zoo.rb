class Zoo 
  attr_reader :name,
              :street,
              :city,
              :state,
              :zip_code,
              :inventory

  def initialize(name, street, city, state, zip_code)
    @name = name
    @street = street
    @city = city
    @state = state
    @zip_code = zip_code
    @inventory = []
  end

  def address 
    "#{@street} #{@city}, #{@state} #{@zip_code}"
  end

  def add_animal(animal)
    @inventory << animal
  end

  def animal_count 
    @inventory.count
  end

  def animals_older_than(weeks)
    animal_age_weeks = []
    @inventory.each do |animal| 
      if animal.age_in_weeks >= weeks
       animal_age_weeks << animal
      end
    end
    animal_age_weeks
  end

  def total_weight_of_animals
    animal_weight = 0
    @inventory.map do |animal|
      animal_weight += animal.weight_as_integer
    end
    animal_weight
  end

  def details 
    zoo_details = {
      :total_weight.to_s => total_weight_of_animals,
      :street_address.to_s => street
    }   
  end

  def animals_sorted_by_weight
    inventory.sort_by { |animal| -animal.weight_as_integer }
    # inventory.sort_by { |animal| animal.weight_as_integer }.reverse
  end

  def animal_hash 
    animal_kind_hash = {}
    @inventory.each do |animal|
      if !animal_kind_hash[animal.first_letter]
        animal_kind_hash[animal.first_letter] = [animal]
      else
        animal_kind_hash[animal.first_letter] << animal
      end 
    end
    animal_kind_hash
  end
end

