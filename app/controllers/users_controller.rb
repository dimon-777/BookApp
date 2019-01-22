class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :add_favorite, :remove_favorite, :my_illustrations]

  
  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  def home
    unless logged_in?
      redirect_to welcome_path
    end
  end

  def show
  end

  # GET /users/1
  # GET /users/1.json

  # GET /users/new
  def new
    
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    unless logged_in?
      redirect_to welcome_path
    end
  end

  # POST /users
  # POST /users.json
  def create
      @user = User.create(user_params)
      session[:user_id] = @user.id
    if @user.save
      UserMailer.with(email: @user.email).registration_confirmation.deliver_now
      flash[:success] = "Please confirm your email address to continue"
      @user.avatar.attach(user_params[:avatar])
      redirect_to root_url
    else
      flash[:error] = "Ooooppss, something went wrong!"
      render 'new'
    end
    
  end

  def confirm_email
    @user = User.find_by_confirm_token(user_params)
    if @user
      user.email_activate
      flash[:success] = "Welcome to the Book App! Your email has been confirmed.
      Please sign in to continue."
      redirect_to root_url
    else
      flash[:error] = "Sorry. User does not exist"
      redirect_to root_url
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    p "DESTROYED"
    respond_to do |format|
      format.html { redirect_to root_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def add_favorite
    @user.favorites << Book.find(params[:book_id])
    respond_to do |format|
      format.html { redirect_back(fallback_location: @user, notice: 'Your Book-List has been updated') }
    end
  end
 
  def remove_favorite
    @user.favorites.delete(params[:book_id])
    respond_to do |format|
      format.html { redirect_back(fallback_location: @user, notice: 'Your Book-List has been updated') }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :user_type, :password, :password_confirmation, :bio, :avatar)
    end
  
    def allowed_params
      params.require(:sessions).permit(:email, :password, :password_confirmation, :avatar)
    end

    def confirm_avatar
      if @user.avatar.nil?
      flash[:error] = "Sorry. User does not exist"
      redirect_to root_url
      end
    end

end
