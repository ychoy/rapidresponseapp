class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def search
    @lawyer = User.first
    expertise = Expertise.find_by_id(params[:id])
    @users = UserExpertise.where(expertise_id: expertise)
  end

  def index
    @user = User.new
    @expertises = Expertise.all
  end

  # GET /users/1
  # GET /users/1.json
  def show


  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    @user.password = (Random.rand() * 10000).floor.to_s
    @user.helping = params[:helping]
      if @user.save
        term = params[:expertise].gsub!(/\s+/, '')
        expertise = Expertise.find_by(name: term)
        login(@user)
        redirect_to search_path(expertise.id)
      end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    if @user.update(user_params)
      redirect_to root_path
    else
      flash[:error] = "bad params"
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:username, :first_name, :last_name, :prefix, :email, :password_digest, :title, :company, :address, :biography, :profession, :helping, :under_18?, :danger?, :contact_ice_24_hours?)
    end
end
