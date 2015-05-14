require("bundler/setup")
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
  @categories = Category.all()
  erb(:index)
end

post('/') do
  category_name = params.fetch('category_name')
  new_cateogry = Category.create({:name => category_name})
  @categories = Category.all()
  erb(:index)
end

get('/delete_category/:id') do
  category = Category.find(params.fetch('id').to_i())
  category.delete()
  @categories = Category.all()
  erb(:index)
end

get('/category/:id') do
  @recipes = Recipe.all()
  @category = Category.find(params.fetch('id').to_i())
  erb(:category_list)
end

post('/category/:id') do
  @category = Category.find(params.fetch('id').to_i())
  recipe_id = params.fetch('recipe_to_add').to_i()
  recipe = Recipe.find(recipe_id)
  @category.recipes.push(recipe)
  @recipes = Recipe.all()
  erb(:category_list)
end

get('/recipes/all') do
  @recipes = Recipe.all()
  erb(:all_recipes)
end

post('/recipes/all') do
  recipe_name = params.fetch('recipe_name')
  new_recipe = Recipe.create({:name => recipe_name})
  @recipes = Recipe.all()
  erb(:all_recipes)
end

get('/recipe/:id') do
  @recipe = Recipe.find(params.fetch('id').to_i())
  @ingredients = Ingredient.all()
  erb(:add_to_recipe_form)
end

post('/recipe/:id') do
  @recipe = Recipe.find(params.fetch('id').to_i())
  recipe_rating = params.fetch('recipe_rating')
  recipe_instructions = params.fetch('recipe_instructions')
  if recipe_rating == ""
    recipe_rating = @recipe.rating
  end
  if recipe_instructions == ""
    recipe_instructions = @recipe.instructions
  end
  @recipe.update({:rating => recipe_rating, :instructions => recipe_instructions})

  ingredient_id = params.fetch('ingredient_to_add').to_i()
  ingredient = Ingredient.find(ingredient_id)
  @recipe.ingredients.push(ingredient)
  @ingredients = Ingredient.all()
  erb(:add_to_recipe_form)
end

get('/ingredients_list') do
  @ingredients = Ingredient.all()
  erb(:ingredient_list)
end

post('/ingredients_list') do
  ingredient_name = params.fetch('recipe_ingredient')
  new_ingredient = Ingredient.create({:name => ingredient_name})
  @ingredients = Ingredient.all()
  erb(:ingredient_list)
end

get('/delete_recipe/:id') do
  recipe = Recipe.find(params.fetch("id").to_i())
  recipe.delete()
  @recipes = Recipe.all()
  erb(:all_recipes)
end

get('/delete_ingredient/:id') do
  ingredient = Ingredient.find(params.fetch("id").to_i())
  ingredient.delete()
  @ingredients = Ingredient.all()
  erb(:ingredient_list)
end

get('/ratings') do
  @ratings = Recipe.all()
  erb(:ratings)
end
