require 'open-uri'
require 'nokogiri'



class ScrapeAllRecipesService


  def initialize(ingredient)
    @ingredient = ingredient
  end

  def call
    url = "https://www.allrecipes.com/search/results/?search=#{@ingredient}"
    html = URI.open(url).read
    doc = Nokogiri::HTML(html)
    recipes = []

    doc.search(".card__recipe").first(5).each do |element|
      title = element.search('.card__title').text.strip
      description = element.search(".card__summary").text.strip
      link = element.search(".card__titleLink").first["href"]

      html_details = URI.open(link).read
      doc_details = Nokogiri::HTML(html_details)

      prep_time = doc_details.search(".recipe-meta-item").first.text.strip

      recipes << Recipe.new(name: title, description: description, prep_time: prep_time)


    end


    return recipes

  end

end
