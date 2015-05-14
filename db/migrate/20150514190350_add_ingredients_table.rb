class AddIngredientsTable < ActiveRecord::Migration
  def change
    remove_column(:recipes, :ingredients, :string)

    create_table(:ingredients) do |t|
      t.column(:name, :string)
    end
  end
end
