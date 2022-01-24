require 'csv'
require_relative 'recipe'

class Cookbook

  def initialize(csv_path)
    @csv_path = csv_path
    @recipes = []
    load_csv
  end

  def all
    @recipes
  end

  def add_recipe(recipe)
    @recipes << recipe
    store_csv
  end

  def remove_recipe(index)
    @recipes.delete_at(index)
    store_csv
  end

  def mark_recipe_as_done(index)
    @recipes[index].mark_as_done!
    store_csv
  end


  private

  def load_csv
    CSV.foreach(@csv_path, headers: :first_row, header_converters: :symbol) do |row|
      row[:done] = row[:done] == "true"

      @recipes << Recipe.new(row)
    end
  end

  def store_csv
    CSV.open(@csv_path, 'wb') do |csv|
      csv << ["name", "description", "done", "prep_time"]
      @recipes.each do |recipe|
        csv << [recipe.name, recipe.description, recipe.done?, recipe.prep_time]
      end
    end
  end
end

















