class CreateTables < ActiveRecord::Migration
  def change
    create_table(:categories) do |t|
      t.column(:name, :string)
    end

    create_table(:recipes) do |t|
      t.column(:name, :string)
      t.column(:rating, :integer)
      t.column(:ingredients, :string)
      t.column(:instructions, :string)
    end

    end
end
