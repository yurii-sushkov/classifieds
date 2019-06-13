class CreateAdvertisements < ActiveRecord::Migration[5.2]
  def change
    create_table :advertisements do |t|
      t.string :title
      t.string :text
      t.belongs_to :subcategory, index: true
      t.belongs_to :user, index: true
      t.timestamps
    end
  end
end
