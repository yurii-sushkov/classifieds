class Category < ApplicationRecord
  validates :title, presence: true, uniqueness: { case_sensitive: false },
            length: { minimum: 3, maximum: 20 }
  has_many :subcategories, dependent: :destroy
end
