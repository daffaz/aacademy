class Dog
  # @param [String] name
  # @param [String] breed
  # @param [Integer] age
  # @param [String] bark
  # @param [Array] favorite_foods
  def initialize(name, breed, age, bark, favorite_foods)
    @name = name
    @breed = breed
    @age = age
    @bark = bark
    @favorite_foods = favorite_foods
  end

  def name
    @name
  end

  def breed
    @breed
  end

  def age
    @age
  end

  # @param [Integer] age
  def age=(age)
    @age = age
  end

  def bark
    if @age > 3
      @bark.upcase
    else
      @bark.downcase
    end
  end

  def favorite_foods
    @favorite_foods
  end

  # @param [String] food
  def favorite_food?(food)
    @favorite_foods.each do |fav_food|
      return true if food.downcase == fav_food.downcase
    end
    false
  end


end
