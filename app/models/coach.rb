class Coach < ApplicationRecord
    has_secure_password
    validates :email, {presence: true, uniqueness: true}
    validates :name, {presence: true}

    def courses
        return Course.where(coach_id: self.id)
    end
end
