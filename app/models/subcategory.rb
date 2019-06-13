class Subcategory < ApplicationRecord
  validates :title, presence: true, uniqueness: { case_sensitive: false },
            length: { minimum: 3, maximum: 20 }
  validates :description, length: { maximum: 100 }
  belongs_to :category
  accepts_nested_attributes_for :category
end
