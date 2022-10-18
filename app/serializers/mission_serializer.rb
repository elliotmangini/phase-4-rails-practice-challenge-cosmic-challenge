class MissionSerializer < ActiveModel::Serializer
  # attributes :id, :name
  belongs_to :planet

end
