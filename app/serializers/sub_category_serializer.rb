class SubCategorySerializer < ActiveModel::Serializer
  attributes :id

  belongs_to :category
end