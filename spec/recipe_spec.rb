require('spec_helper')

describe(Recipe) do

  it('has many categories') do
    test_recipe = Recipe.create(:name => "Pizza", :rating => 1, :instructions => "Knead")
    category1 = test_recipe.categories.create(:name => "Breakfast")
    category2 = test_recipe.categories.create(:name => "Dinner")
    expect(test_recipe.categories()).to(eq([category1, category2]))
  end

  it('validates presence of name') do
    recipe = Recipe.create({:name => ""})
    expect(recipe.save()).to(eq(false))
  end
end
