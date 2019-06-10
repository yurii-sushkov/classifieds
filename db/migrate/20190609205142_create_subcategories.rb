class CreateSubcategories < ActiveRecord::Migration[5.2]
  def change
    create_table :subcategories do |t|
      t.belongs_to :category, index: true
      t.string :title
      t.string :description
      t.timestamps
    end
  end
end
