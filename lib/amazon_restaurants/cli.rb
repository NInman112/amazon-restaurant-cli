class CLI

  def start
    puts 'Find local restaurants available through Amazon Restaurants!'
    menu
  end

  def menu
    Scraper.new.scrape_cities
    Cities.print
    #binding.pry
    loop do
      puts "Please make a selection or type 'cusine' to search or 'exit':"
      input = gets.chomp
      case input.downcase
      when 'exit'
        puts 'Exiting the program...'
        exit
      when 'cusine'
        cusine_search
      when '1'
        puts "Hello, you pushed #{Cities.all[input.to_i].name}."
      when '2'
        puts "Hello, you pushed #{Cities.all[input.to_i].name}."
      when '3'
        puts "Hello, you pushed #{Cities.all[input.to_i].name}."
      when '4'
        puts "Hello, you pushed #{Cities.all[input.to_i].name}."
      end
    end
  end

  def cusine_search
    Scraper.new.scrape_cusines
    loop do
      puts "Please enter your desired cusine,'list' to see available cusines, or 'menu' to return to the main menu:"
      input = gets.chomp
      input.downcase
      if Cusines.find_by_name(input)!= nil
        puts "#{Cusines.find_by_name(input).name}"
      elsif input == 'list'
        Cusines.print
      elsif input == 'menu'
        menu
      else
        puts "Please try another selection..."
      end
    end
  end

end
