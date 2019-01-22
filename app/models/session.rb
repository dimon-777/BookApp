class Session < ApplicationRecord
    belongs_to :user
    validates :user_email, presence: true
    validates :user_password, presence: true
   
end
