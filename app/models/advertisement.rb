class Advertisement < ApplicationRecord
  belongs_to  :subcategory
  belongs_to  :user
  validates   :title, presence: true, length: { minimum: 5, maximum: 30 }
  validates   :text, presence: true, length: { minimum: 10,  maximum: 120 }

  def author
    User.find(user_id).email
  end

end
