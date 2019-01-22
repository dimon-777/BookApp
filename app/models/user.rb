class User < ApplicationRecord
    has_secure_password
    before_create :confirmation_token
    has_one_attached :avatar
    has_many :books
    has_one :profile
    has_many :illustrations
    has_and_belongs_to_many :favorites, class_name: "Book", join_table: "booklists", foreign_key: "user_id", association_foreign_key: "book_id"
    validates :first_name, presence: true
    validates :last_name, presence: true           
    validates :email, presence: true, uniqueness: true  
    validates :password, presence: true
    validates :password, confirmation: true
    
    
    TYPE = [ 'Author','Reader']
    
    def email_activate
        self.email_confirmed = true
        self.confirm_token = nil
        save!(:validate => false)
    end

    def user_avatar?
        unless self.avatar.blank
            flash[:error] = "Ooooppss, something went wrong!"  
        end
    end
    
    private
    def confirmation_token
      if self.confirm_token.blank?
          self.confirm_token = SecureRandom.urlsafe_base64.to_s
      end
    end

    def confirm_avatar
        if @user.avatar.nil?
        flash[:error] = "Sorry. User does not exist"
        redirect_to root_url
        end
    end

    # def thumbnail input
    #     return self.avatar(input).variant( resize: '100x100!').processed
    # end
end
