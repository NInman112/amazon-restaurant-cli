class CLI
  def start
    puts 'Find local restaurants available through Amazon Restaurants!'.colorize(:green)
    puts "Loading additional data....  please wait a moment..".colorize(:red)
    Scraper.new.scrape_cities
    Scraper.new.scrape_cuisines
    menu
  end

  def menu
    loop do
      puts "Please type 'cuisine' to search cuisines, 'city' to select a city or 'exit':".colorize(:red)
      input = gets.chomp
      case input.downcase
      when 'exit'
        puts 'Exiting the program...'
        exit
      when 'cuisine'
        cuisine_search
      when 'city'
        city_select
      when 'test'
        #testing
      end
    end
  end

  def city_select
    loop do
      Cities.print
      puts "Please make a selection, or enter '0' to go to the menu:".colorize(:red)
      input = gets.chomp
      name = Cities.all[input.to_i - 1].name.downcase

      if name == "los angeles and orange county, ca"
        name = "los-angeles, zz"
      elsif name == "bay area, ca"
        name = "san-francisco"
      elsif name == "manhattan and brooklyn, ny"
        name = "new-york, zz"
      elsif name == "washington, d.c. area"
        name = "washington-dc, zz"
      end
      case input.to_i
      when 1..20
        puts "Restaurants in the #{Cities.all[input.to_i - 1].name} area: ".colorize(:blue)
        Restaurant.print_details(name.split(", ")[0])
      when 0
        menu
      end
    end
  end

  def cuisine_search
    loop do
      puts "Please enter your desired cusine,'list' to see available cusines, or 'menu' to return to the main menu:".colorize(:red)
      input = gets.chomp
      input.downcase

      if Cuisines.find_by_name(input)!= nil
        puts "#{Cuisines.find_by_name(input).name} cuisine:".colorize(:blue)
        Cuisines.print_details(input)
      elsif input == 'list'
        Cuisines.print
      elsif input == 'menu'
        menu
      else
        puts "Please try another selection..."
      end
    end
  end

end
