class CLI

  def start
    puts 'Find local restaurants available through Amazon Restaurants!'
    menu
  end

  def menu
    loop do
      puts "Please type 'cusine' to search cusines, 'city' to select a city or 'exit':".colorize(:red)
      input = gets.chomp
      case input.downcase
      when 'exit'
        puts 'Exiting the program...'
        exit
      when 'cusine'
        cusine_search
      when 'city'
        city_select
      end
    end
  end

  def city_select
    Scraper.new.scrape_cities
    loop do
      Cities.print
      puts "Please make a selection, or enter '0' to go to the menu:".colorize(:red)
      input = gets.chomp
      name = Cities.all[input.to_i - 1].name.downcase
      if name == "los angeles and orange county, ca"
        name = "los-angeles, zz"
      elsif name == "manhattan and brooklyn, ny"
        name = "new-york, zz"
      elsif name == "washington, d.c. area"
        name = "washington-dc, zz"
      end
      case input.to_i
      when 1..20
        puts "Restaurants in the #{Cities.all[input.to_i - 1].name} area: ".colorize(:blue)
        new_restaurants = Scraper.new.scrape_details(name.split(", ")[0])
        Restaurant.create_from_collection(new_restaurants)
        Restaurant.print
        Restaurant.delete
        puts "Press any key to continue...".colorize(:red)
        gets
      when 0
        menu
      end
    end
  end

  def cusine_search
    Scraper.new.scrape_cusines
    loop do
      puts "Please enter your desired cusine,'list' to see available cusines, or 'menu' to return to the main menu:".colorize(:red)
      input = gets.chomp
      input.downcase
      if Cusines.find_by_name(input)!= nil
        puts "#{Cusines.find_by_name(input).name} cusine:".colorize(:blue)
        new_cusines = Scraper.new.scrape_details(input.downcase)
        Restaurant.create_from_collection(new_cusines)
        Restaurant.print
        Restaurant.delete
        puts "Press any key to continue...".colorize(:red)
        gets
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
