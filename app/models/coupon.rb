class Coupon < ApplicationRecord
    belongs_to :pass, foreign_key: "code_id"
    validates :code_expiry, presence: true
    validates :code, presence: true
end