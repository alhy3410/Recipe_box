require('spec_helper')

describe(Category) do
  it('has many recipes') do
    test_category = Category.create(:name => "Lunch Items")
    recipe1 = test_category.recipes.create(:name => "Pizza")
    recipe2 = test_category.recipes.create(:name => "Hotdogs")
    expect(test_category.recipes()).to(eq([recipe1, recipe2]))
  end

  it('validates presence of name') do
    category = Category.create({:name => ""})
    expect(category.save()).to(eq(false))
  end
end
