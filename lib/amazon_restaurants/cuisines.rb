class Cuisines
  extend Findable
  extend Printable::ClassMethods
  extend Printable::InstanceMethods
  attr_accessor :name
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

   def self.all
     @@all
   end

end
