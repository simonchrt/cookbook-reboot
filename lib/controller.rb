require_relative 'view'

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

    recipe = Recipe.new(name, description)
    @cookbook.add_recipe(recipe)
    list
  end

  def destroy
    list
    index = @view.ask_user_for("index").to_i - 1
    @cookbook.remove_recipe(index)
    list
  end
end
