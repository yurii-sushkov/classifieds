class Advertisement < ApplicationRecord
  include     PgSearch

  pg_search_scope :search, against: %i(title text)
  pg_search_scope :search_by_user, against: :user_id
  belongs_to  :subcategory
  belongs_to  :user
  validates   :title, presence: true, length: { minimum: 5, maximum: 30 }
  validates   :text, presence: true, length: { minimum: 10,  maximum: 120 }

  def author
    User.find(user_id).name
  end

  def author_email
    User.find(user_id).email
  end

  def category_id
    Category.find(Subcategory.find(subcategory_id).category_id).id
  end

  def category
    Category.find(Subcategory.find(subcategory_id).category_id).title
  end

  def subcategory
    Subcategory.find(subcategory_id).title
  end
end
