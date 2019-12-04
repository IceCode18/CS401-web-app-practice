class PublicCoupon < ApplicationRecord
    validates :code, presence: true
    validates :pub_id, presence: true
    validates :site, presence: true
end
