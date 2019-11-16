class CategorySerializer < ActiveModel::Serializer
  attributes :id

  belongs_to :budget
  has_many :sub_categories
end