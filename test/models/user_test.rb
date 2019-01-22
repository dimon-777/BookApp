require_relative '../test_helper'
require 'shoulda'

class UserTest < ActiveSupport::TestCase
  def setup  
    @user = User.new 
  end 
  
  # assert_includes(@user.errors[:email], "can’t be blank")  

end  


