class Exercise < ApplicationRecord
    validates :name, presence: true
    validates :sets, presence: true 
    validates :reps, presence: true 
    validates :weight, :numericality => true
    belongs_to :user
    belongs_to :coach 
    accepts_nested_attributes_for :coach

    scope :by_coach, -> (id) {where("coach_id == ?", id)}

    def coach_attributes=(coach_hash)
        self.coach = Coach.find_or_create_by(coach_hash)
    end 

end
