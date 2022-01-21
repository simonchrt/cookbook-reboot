class View
  def display(recipes)
    recipes.each_with_index do |recipe, index|
      puts "#{index + 1}- #{recipe.name} -- #{recipe.description} "
    end
  end


  def ask_user_for(stuff)
    p "#{stuff} ?"
    return gets.chomp
  end




end
