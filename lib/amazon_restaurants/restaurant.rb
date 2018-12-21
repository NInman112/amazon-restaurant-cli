class Restaurant
  extend Findable
  attr_accessor :name, :category, :rating, :price
  @@all = []

  def initialize(restaurant_hash)
    restaurant_hash.each {|key, value| self.send("#{key}=",value)}
    @@all << self
  end

  def self.create_from_collection(restaurant_array)
      restaurant_array.each {|rest| self.new(rest)}
  end

  def self.all
    @@all
  end

  def self.print
    @@all.each.with_index(1) do |restaurant, index|
      puts "#{index}. #{restaurant.name}, #{restaurant.category}, #{restaurant.rating}, #{restaurant.price}"
    end
  end

  def self.delete
    @@all.clear
  end

end
