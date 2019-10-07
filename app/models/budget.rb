class Budget < ApplicationRecord
  belongs_to :user
  has_many :accounts
  has_many :categories

  validates_presence_of :name
end
