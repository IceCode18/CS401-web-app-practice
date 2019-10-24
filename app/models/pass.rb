class Pass < ApplicationRecord
    has_many :coupons, foreign_key: "code_id"
    validates :from, presence: true
    validates :code, presence: true
end
