class Lunch < ApplicationRecord
    validates :name, :price, presence: true  #requires that name and price are input for creating Lunch objects
    belongs_to :user
    has_one_attached :picture
end
