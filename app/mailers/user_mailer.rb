class UserMailer < ApplicationMailer
    default :from => "Wyncode3458@gmail.com"

    def registration_confirmation
        @email = params[:email]
        @user = User.last
        mail(:to => @email, :subject => "Registration Confirmation")
    end
end
