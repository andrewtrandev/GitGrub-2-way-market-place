class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :favorites, dependent: :destroy
  has_many :lunches, dependent: :destroy
  #note that favorites has to be deleted first or you'll get a foreign key violation if you try to delete a user due to favorites having to rely on lunches
end
