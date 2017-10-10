class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    # render 'index'
    session[:count] ||=0
  end
  # POST /users
  # POST /users.json
  def create
    session[:count] += 1
    flash[:success] = "What is up jahahsahdas"
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        # format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :location, :language, :comment)
    end
end

# class SurveysController < ApplicationController
#     def index
#         # Set session views to zero if it doesn't exist yet
#         session[:views] ||= 0
#     end
#
#     def process_survey
#         # Increment the session views upon submission of the form
#         session[:views] += 1
#
#         # Save the post data (params[:survey]) to session
#         session[:result] = params[:survey]
#
#         # Save success message to flash to show it once
#         flash[:success] = "Thanks for submitting this form! You have submitted this form #{ session[:views] } time(s) now."
#
#         # To prevent submission of form with page reload
#         redirect_to '/surveys/result'
#     end
#
#     def result
#         # Save the data to variable accessible in the views
#         @result = session[:result]
#     end
# end
