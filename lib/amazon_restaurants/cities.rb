class Cities
  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def self.print
    @@all.each.with_index(1) do |city, index|
      puts "#{index}. #{city.name}"
    end
  end

  def self.find(city_input)

  end

end