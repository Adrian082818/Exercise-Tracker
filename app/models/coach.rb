class Coach < ApplicationRecord
    validates :name, presence: true, uniqueness: true 
    has_many :exercises
    has_many :users, through: :exercises
end
