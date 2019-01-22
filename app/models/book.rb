class Book < ApplicationRecord
  belongs_to :user
  has_many :chapters, dependent: :destroy
  has_many :illustrations
  has_one_attached :cover
  scope :search,    ->  (term) { where("genre iLIKE ? OR name iLIKE ?", "%#{term}%", "%#{term}%" ) }

  include ActionDispatch::Routing::PolymorphicRoutes
  include Rails.application.routes.url_helpers
  def as_json(options={})
    {
      id:          id,
      name:        name,
      genre:       genre,
      cover:       self.cover.attached? ? polymorphic_url(self.cover) : "/assets/placeholder-8d4940ab726b4c914898dfed6f83556a793e8d1f285d34bb2cb48d45787817be.jpg"
    }
  end

end


