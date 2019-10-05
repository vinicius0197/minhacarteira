class Transaction < ApplicationRecord
  belongs_to :account
  belongs_to :sub_category
end
