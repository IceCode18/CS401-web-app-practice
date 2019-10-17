class Pass < ApplicationRecord
    validates :from, presence: true
    validates :code, presence: true
end
