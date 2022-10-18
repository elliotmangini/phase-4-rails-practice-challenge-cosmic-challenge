class Mission < ApplicationRecord
  belongs_to :scientist
  belongs_to :planet
  validates :name, :presence => true
  validates :scientist_id, :presence => true
  validates :planet_id, :presence => true
  # validate :no_rejoins

  # def no_rejoins
  #   scientist = Scientist.find(:scientist_id)
  #   if scientist.missions.find_by(name: :name)
  #     errors.add(:name, "mission already exists")
  #   end

  # end
end
