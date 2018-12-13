class Category < ApplicationRecord
  has_many :expenses # NO, dependent: :destroy
end
