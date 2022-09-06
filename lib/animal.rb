class Animal 
  attr_reader :kind,
              :weight,
              :age

  def initialize(kind, weight, age)
    @kind = kind
    @weight = weight
    @age = "#{age} weeks"
  end

  def weight 
    "#{@weight} pounds"
  end

  def weight_as_integer
    @weight.to_i
  end

  def age_in_weeks
    @age.to_i
  end

  def age_in_days
    @age.to_i * 7
  end

  def feed!(number)
   @weight += number
  end

  def first_letter
    kind.chr
    # kind[0]
  end
end