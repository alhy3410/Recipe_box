require('spec_helper')

describe(Recipe) do
  describe('#categories') do
    it('has many categories') do
      test_recipe = Recipe.create(:name => "Pizza")
      category1 = test_recipe.categories.create(:name => "Breakfast")
      category2 = test_recipe.categories.create(:name => "Dinner")
      expect(test_recipe.categories()).to(eq([category1, category2]))
    end
  end
end
