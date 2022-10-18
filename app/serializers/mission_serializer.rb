class MissionSerializer < ActiveModel::Serializer
  # attributes :id, :name
  has_one :planet

end
