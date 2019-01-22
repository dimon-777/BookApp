class Illustration < ApplicationRecord
  belongs_to :user
  belongs_to :book
  has_one_attached :illustration
end

