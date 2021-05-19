require 'rspec'
require './lib/animal'

RSpec.describe Animal do
  it 'exists' do
    animal = Animal.new("Sea Otter", 10, 25)

    expect(animal).to be_a(Animal)
  end

  it 'has a kind' do
    animal = Animal.new("Sea Otter", 10, 25)

    expect(animal.kind).to eq("Sea Otter")
  end

  it 'has a weight' do
    animal = Animal.new("Sea Otter", 10, 25)

    expect(animal.weight).to eq("10 pounds")
  end

  it 'has a weight as integer' do
    animal = Animal.new("Sea Otter", 10, 25)

    expect(animal.weight_as_integer).to eq(10)
  end

  it 'has an age' do
    animal = Animal.new("Sea Otter", 10, 25)

    expect(animal.age).to eq("25 weeks")
  end

  it 'has an age in weeks' do
    animal = Animal.new("Sea Otter", 10, 25)

    expect(animal.age_in_weeks).to eq(25)
  end

  it 'has an age in days' do
    animal = Animal.new("Sea Otter", 10, 25)

    expect(animal.age_in_days).to eq(175)
  end

  it "can #feed!" do
    animal = Animal.new("Sea Otter", 10, 25)

    animal.feed!(2)
    expect(animal.weight).to eq("12 pounds")
    animal.feed!(1)
    expect(animal.weight).to eq("13 pounds")
  end

  it "can extract first letter of kind" do
    animal_1 = Animal.new("Sea Otter", 10, 25)
    animal_2 = Animal.new("Red Panda", 5, 70)
    animal_3 = Animal.new("Capybara", 100, 150)
    animal_4 = Animal.new("Dolphin", 150, 200)
    animal_5 = Animal.new("Dog", 65, 200)

    expect(animal_1.first_letter).to eq("S")
    expect(animal_2.first_letter).to eq("R")
    expect(animal_3.first_letter).to eq("C")
    expect(animal_4.first_letter).to eq("D")
    expect(animal_5.first_letter).to eq("D")
  end
end
