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
  erb(:add_to_recipe_form)
end

post('/recipe/:id') do
  @recipe = Recipe.find(params.fetch('id').to_i())
  recipe_rating = params.fetch('recipe_rating')
  recipe_ingredients = params.fetch('recipe_ingredients')
  recipe_instructions = params.fetch('recipe_instructions')
  if recipe_rating == ""
    recipe_rating = @recipe.rating
  end
  if recipe_ingredients == ""
    recipe_ingredients = @recipe.ingredients
  end
  if recipe_instructions == ""
    recipe_instructions = @recipe.instructions
  end
  @recipe.update({:rating => recipe_rating, :ingredients => recipe_ingredients, :instructions => recipe_instructions})
  erb(:add_to_recipe_form)
end

get('/delete_recipe/:id') do
  recipe = Recipe.find(params.fetch("id").to_i())
  recipe.delete()
  @recipes = Recipe.all()
  erb(:all_recipes)
end
