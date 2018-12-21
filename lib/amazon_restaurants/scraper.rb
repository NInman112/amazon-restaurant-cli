class Scraper
  def scrape_page(html = 'https://www.amazon.com/restaurants?')
    doc = Nokogiri::HTML(open(html))
  end

  def scrape_cities
    scrape_page.search(".a-size-base-plus").each do |city|
      if city.text != 'Skip for now'
        Cities.new(city.text)
      end
    end
  end

  def scrape_cusines
    scrape_page.search(".a-link-normal.hw-seo-page-footer-links").each do |cusine|
      Cusines.new(cusine.text)
    end
  end

  def scrape_details(name)
    if name == "breakfast & brunch" || name == "juice Bars & smoothies"
      new_name = name.split(" & ").join("-and-")
    elsif name == "cajun & creole" || name == "persian & iranian"
      new_name = name.split(" & ").join("-")
    elsif name == "salads"
      new_name = name.chop
    else
      new_name = name.split(" ").join("-")
    end
    detail_array = []
    counter = 0
    scrape_page("https://www.amazon.com/restaurants/delivery/#{new_name}?").search(".hw-grid-card-list-item-desc").each do |details|
      detail_array << {
        :name => details.css(".a-size-base.a-color-base.a-text-ellipsis.hw-grid-card-hover-title.a-text-bold").text,
        :category => details.css(".hw-grid-card-subcat.a-text-ellipsis").text.strip,
        :rating => details.css(".a-icon-alt").text,
        :price => details.css(".alr-price-tier-value").text
      }
      counter += 1
      if counter == 10
        break
      end
    end
    detail_array
  end

end
