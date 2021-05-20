require 'rspec'
require './lib/animal'
require './lib/zoo'

RSpec.describe Zoo do

  before(:each) do
    @zoo = Zoo.new("Bronx Zoo", "2300 Southern Blvd", "Bronx", "NY", "10460")
  end

  describe 'Class Creation' do

    it 'exists' do
      expect(@zoo).to be_a(Zoo)
    end

    it 'it has attributes' do
      expect(@zoo.name).to eq("Bronx Zoo")
      expect(@zoo.street).to eq("2300 Southern Blvd")
      expect(@zoo.city).to eq("Bronx")
      expect(@zoo.state).to eq("NY")
      expect(@zoo.zip_code).to eq("10460")
      expect(@zoo.inventory).to eq([])
    end
  end

  describe 'Oject Methods' do

    it 'has an address' do
      expect(@zoo.address).to eq("2300 Southern Blvd Bronx, NY 10460")
    end

    it 'it can return an animal count' do
      expect(@zoo.animal_count).to eq(0)
    end

    it 'it can add animals' do
      animal_1 = Animal.new("Sea Otter", 10, 25)
      animal_2 = Animal.new("Red Panda", 5, 70)

      @zoo.add_animal(animal_1)
      @zoo.add_animal(animal_2)

      expect(@zoo.inventory).to eq([animal_1, animal_2])
      expect(@zoo.animal_count).to eq(2)
    end
  end

  describe 'Object Methods - Four Animals' do

    before(:each) do
      @animal_1 = Animal.new("Sea Otter", 10, 25)
      @animal_2 = Animal.new("Red Panda", 5, 70)
      @animal_3 = Animal.new("Capybara", 100, 150)
      @animal_4 = Animal.new("Dolphin", 150, 200)
      @zoo.add_animal(@animal_1)
      @zoo.add_animal(@animal_2)
      @zoo.add_animal(@animal_3)
      @zoo.add_animal(@animal_4)
    end

    it 'it can output animals older than X' do
      expect(@zoo.animals_older_than(250)).to eq([])
      expect(@zoo.animals_older_than(100)).to eq([@animal_3, @animal_4])
      expect(@zoo.animals_older_than(10)).to eq([@animal_1, @animal_2, @animal_3, @animal_4])
    end

    it 'it can show zoo details' do
      expect(@zoo.details).to eq({"total_weight" => 265, "street_address" => "2300 Southern Blvd"})
    end

    it 'it can sort by weight' do
      expect(@zoo.animals_sorted_by_weight).to eq([@animal_4, @animal_3, @animal_1, @animal_2])
    end
  end

  describe 'Object Methods - Five Animals'do

    it 'it can make an animal hash' do
      animal_1 = Animal.new("Sea Otter", 10, 25)
      animal_2 = Animal.new("Red Panda", 5, 70)
      animal_3 = Animal.new("Capybara", 100, 150)
      animal_4 = Animal.new("Dolphin", 150, 200)
      animal_5 = Animal.new("Dog", 65, 200)
      @zoo.add_animal(animal_1)
      @zoo.add_animal(animal_2)
      @zoo.add_animal(animal_3)
      @zoo.add_animal(animal_4)
      @zoo.add_animal(animal_5)

      expected = {
        "C" => [animal_3],
        "D" => [animal_4, animal_5],
        "R" => [animal_2],
        "S" => [animal_1]
      }

      expect(@zoo.animal_hash).to eq(expected)
    end
  end
end
