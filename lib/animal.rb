class Animal

  attr_reader :kind

  def initialize(kind, weight, age)
    @kind = kind
    @weight = weight
    @age = age
  end

  def weight
    "#{@weight} pounds"
  end

  def weight_as_integer
    @weight
  end

  def age
    "#{@age} weeks"
  end

  def age_in_weeks
    @age
  end

  def age_in_days
    @age * 7
  end

  def feed!(number)
    @weight += number
  end

  def first_letter
    kind[0]
  end

end
