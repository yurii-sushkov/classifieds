class Category < ApplicationRecord
  validates :title, presence: true, uniqueness: { case_sensitive: false },
            length: { minimum: 3, maximum: 20 }
  validates :eng_title, presence: true, uniqueness: { case_sensitive: false },
            length: { minimum: 3, maximum: 20 }
  validates :description, length: { maximum: 100 }
  has_many :advertisements, dependent: :destroy
end
