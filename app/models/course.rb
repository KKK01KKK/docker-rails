class Course < ApplicationRecord
    validates :name, {presence:true, length: {maximum: 50}}
    validates :coach_id, {presence: true}

    def coach
        return Coach.find_by(id: self.coach_id)
    end
end