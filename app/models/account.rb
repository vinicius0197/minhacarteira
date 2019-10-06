class Account < ApplicationRecord
  has_many :transactions, dependent: :destroy
  validates_presence_of :name, :balance
end
