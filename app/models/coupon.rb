class Coupon < ApplicationRecord
    validates :coupon_id, presence: true
    validates :code, presence: true
    validates :code_expiry, presence: true
end
