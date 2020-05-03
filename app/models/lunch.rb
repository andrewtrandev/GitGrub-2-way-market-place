class Lunch < ApplicationRecord
    validates :name, :price, presence: true
    #requires that name and price are input for creating Lunch objects
end
