class Animal

  attr_reader :kind, :weight, :age

  def initialize(kind, weight, age)
    @kind = kind
    @weight = weight
    @age = age
  end

  def weight
    @weight.to_s + " pounds"
  end

  def weight_as_integer
    @weight
  end

  def age
    @age.to_s + " weeks"
  end

  def age_in_weeks
    @age
  end

  def age_in_days
    (@age * 7)
  end

  def feed!(number)
    @weight += number
  end

  def first_letter
    kind[0]
  end

end
