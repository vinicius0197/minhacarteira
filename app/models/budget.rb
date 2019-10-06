class Budget < ApplicationRecord
  belongs_to :user
  has_many :accounts
  has_many :categories
end
