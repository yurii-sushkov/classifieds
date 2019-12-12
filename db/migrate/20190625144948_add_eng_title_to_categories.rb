# frozen_string_literal: true

class AddEngTitleToCategories < ActiveRecord::Migration[5.2]
  def change
    add_column :categories, :eng_title, :string
  end
end
