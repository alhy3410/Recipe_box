require("bundler/setup")
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
  @categories = Category.all()
  erb(:index)
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
  @recipe.update({:rating => recipe_rating, :ingredients => recipe_ingredients, :instructions => recipe_instructions})
  erb(:add_to_recipe_form)
end
