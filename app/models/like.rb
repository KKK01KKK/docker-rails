class Like < ApplicationRecord
    validates :user_id, {presence: true}
    validates :course_id, {presence: true}
end
