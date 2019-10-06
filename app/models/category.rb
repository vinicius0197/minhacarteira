class Category < ApplicationRecord
  belongs_to :budget
  has_many :sub_categories
end
