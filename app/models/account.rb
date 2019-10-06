class Account < ApplicationRecord
  belongs_to :budget
  has_many :transactions, dependent: :destroy
  validates_presence_of :name, :balance
end
