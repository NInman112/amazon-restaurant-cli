class Scraper

  def scrape_page
    html = 'https://www.amazon.com/restaurants?'
    doc = Nokogiri::HTML(open(html))
    #doc.css('.hw-asin-grid.aok-clearfix').css('.hw-grid-item.hw-city-list-grid-item').css('.hw-grid-card').css('.hw-city-grid-card-list-item-inner').css('.a-row.hw-city-grid-card-hover').css('.a-size-base-plus').text
  end

  def scrape_cities
    scrape_page.search(".a-size-base-plus").each do |city|
      if city.text != 'Skip for now'
        Cities.new(city.text)
      end
    end
  end

  def scrape_cusines
    cusine = scrape_page.search(".a-link-normal.hw-seo-page-footer-links").each do |cusine|
      Cusines.new(cusine.text)
    end
  end

end
