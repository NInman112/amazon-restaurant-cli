class Cusines
  extend Findable
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
    @@all.each.with_index(1) do |cusine, index|
      puts "#{index}. #{cusine.name}"
    end
  end

end
