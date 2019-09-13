class Advertisement < ApplicationRecord
  include     PgSearch

  pg_search_scope :search, against: %i(title text)
  pg_search_scope :search_by_user, against: :user_id
  belongs_to  :category, class_name: 'Category', foreign_key: :category_id
  belongs_to  :user, class_name: 'User', foreign_key: :user_id
  validates   :title, presence: true, length: { minimum: 5, maximum: 30 }
  validates   :text, presence: true, length: { minimum: 10,  maximum: 120 }
end
