module Printable
  module InstanceMethods
    def print_details(name)
      Scraper.new.scrape_details(name).each.with_index(1) do |key, index|
        puts "#{index}. #{key[:name]}, #{key[:category]}, #{key[:rating]}, #{key[:price]}"
      end
      puts "Press any key to continue...".colorize(:red)
      gets  #pause
    end
  end

  module ClassMethods
    def print
      all.each.with_index(1) do |cusine, index|
        puts "#{index}. #{cusine.name}"
      end
    end
  end

end
