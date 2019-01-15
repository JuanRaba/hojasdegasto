class Category < ApplicationRecord
  has_many :expenses # NO, if you want to destroy a category migrate expenses categories to void, dependent: :destroy
end
