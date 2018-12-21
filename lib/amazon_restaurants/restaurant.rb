class Restaurant
  extend Findable
  extend Printable::ClassMethods
  extend Printable::InstanceMethods
  attr_accessor :name, :category, :rating, :price
  @@all = []

  def initialize(restaurant_hash)  #currently not called upon, capable of creating new restaurants
    restaurant_hash.each {|key, value| self.send("#{key}=",value)}
    @@all << self
  end

  def self.create_from_collection(restaurant_array) #currently not called upon, capable of creating new restaurants from arrays
      restaurant_array.each {|rest| self.new(rest)}
  end

  def self.all
    @@all
  end

  def self.delete
    @@all.clear
  end

end
