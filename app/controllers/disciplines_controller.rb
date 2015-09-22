class DisciplinesController < ApplicationController

	before_action :require_admin_permission

	def index
		@disciplines = Discipline.all
	end
  
  def new
  	@discipline = Discipline.new
  end

  def create
		@discipline = Discipline.new(discipline_params)
		if @discipline.save
			redirect_to disciplines_path
		else
			render :new
		end  	
  end

  def edit
    @discipline = Discipline.find(params[:id])
  end

  def update
    @discipline = Discipline.find(params[:id])
    if @discipline.update(discipline_params)
      redirect_to disciplines_path
    else
      render :edit
    end
  end

	private

  def require_admin_permission
  	unless current_user.has_role? :admin
  		sign_out current_user
  		flash[:error] = "You must be logged as Admin to access this section"
  		redirect_to new_user_session_path
  	end
  end

  def discipline_params
  	params.require(:discipline).permit(:name)
  end

end
