class Recipe
  attr_reader :name, :description, :prep_time

  # def initialize(name, description)
  #   @name = name
  #   @description = description
  # end

   def initialize(attributes = {})
    @name = attributes[:name]
    @description = attributes[:description]
    @done = attributes[:done] || false
    @prep_time = attributes[:prep_time]
  end

  def done?
    @done
  end

  def mark_as_done!
    @done = true
  end

end


# recipe = Recipe.new("Tarte choco", "Pas ouf")

# recipe2 = Recipe.new(name: "Tarte choco", description: "Pas ouf")
# recipe3 = Recipe.new(description: "Pas ouf", name: "Tarte choco")

#<CSV::Row "name":"Beans & Bacon breakfast" " description":"Beans description">


# recipe3 = Recipe.new(description: "Pas ouf")









