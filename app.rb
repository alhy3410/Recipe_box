require("bundler/setup")
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
  @categories = Category.all()
  erb(:index)
end

get('/recipes/all') do
  @recipies = Recipe.all()
  erb(:all_recipes)
end
