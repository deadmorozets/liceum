class ControlPanelController < ApplicationController
  before_action :require_admin_permission

  def index
  	@users = User.all.order(:last_name, :first_name)
  end

  def profile
  	@user = User.find(params[:id])
  	@roles = Role.all
  end

  def profile_update
  	user = User.find(params[:id])
  	if user.update(person_params)
  		
  		redirect_to :admin
  	else 
  		render 'profile'
  	end
  end

  def schedule
    @grade_id = Grade.find(params[:grade_id])
    params_date = params[:date].to_date
    @first_date = params_date - params_date.wday + 1
    @lessons = Lesson.where("grade_id = ? AND lesson_date >= ? AND lesson_date < ?",
                              @grade_id, @first_date, @first_date + 7).order(:lesson_date, :schedule_id)


  end

  private

  def require_admin_permission
  	unless current_user.has_role? :admin
  		sign_out current_user
  		flash[:error] = "You must be logged as Admin to access this section"
  		redirect_to new_user_session_path
  	end
  end

  def person_params
  	params.require(:user).permit(:first_name, :last_name, :email, :grade_id, :role_ids => [])
  end

end
