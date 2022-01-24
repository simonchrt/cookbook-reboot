require_relative 'view'
require_relative 'scrape_all_recipes_service'

class Controller
  def initialize(cookbook)
    @cookbook = cookbook
    @view = View.new
  end

  def list
    recipes = @cookbook.all
    @view.display(recipes)

  end

  def create
    name = @view.ask_user_for("name")
    description = @view.ask_user_for("description")

    recipe = Recipe.new(name: name,description: description)
    @cookbook.add_recipe(recipe)
    list
  end

  def destroy
    list
    index = @view.ask_user_for("index").to_i - 1
    @cookbook.remove_recipe(index)
    list
  end

  def scrape_from_the_web
    ingredient = @view.ask_user_for("ingredient")
    scrape_service = ScrapeAllRecipesService.new(ingredient)
    recipes = scrape_service.call

    @view.display(recipes)

    index = @view.ask_user_for("index").to_i - 1

    @cookbook.add_recipe(recipes[index])
  end



  def mark_as_done
    list
    index = @view.ask_user_for("index").to_i - 1
    @cookbook.mark_recipe_as_done(index)

  end

end
