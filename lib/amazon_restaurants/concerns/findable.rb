module Findable
  def find_by_name(name)
    all.find do |value|
      if value.name.downcase == name
        value.name.downcase
      else
        nil
      end
    end
  end

end
