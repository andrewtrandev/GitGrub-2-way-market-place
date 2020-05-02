class Lunch < ApplicationRecord
    validates :name, :price, presence: true
end
