class Subcategory < ApplicationRecord
  validates   :title, presence: true, uniqueness: { case_sensitive: false },
              length: { minimum: 3, maximum: 20 }
  validates   :description, length: { maximum: 100 }
  belongs_to  :category, optional: true
  has_many    :advertisements, dependent: :destroy
  accepts_nested_attributes_for :category

  def category
    Category.find(category_id).title
  end
end
