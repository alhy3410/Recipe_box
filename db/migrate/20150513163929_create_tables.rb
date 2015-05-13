class CreateTables < ActiveRecord::Migration
  def change
    create_table(:categories) do |t|
      t.column(:name, :string)
    end

    create_table(:recipies) do |t|
      t.column(:name, :string)
      t.column(:rating, :integer)
      t.column(:ingredients, :string)
      t.column(:instructions, :string)
    end

    create_table(:recipe_category) do |t|
      t.column(:recipe_id, :integer)
      t.column(:category_id, :integer)
    end
  end
end
