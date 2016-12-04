class ActivitiesController < InheritedResources::Base

before_action :authenticate_user!
before_action :set_company
load_and_authorize_resource

	def index
		# @activities = @company.activities.all
		redirect_to @company
	end

	def show
		@activity = @company.activities.find(params[:id])
	end

	def new
		@activity = @company.activities.new
	end

	def edit
		@activity =  @company.activities.find(params[:id])
	end

	def create
		@activity =  @company.activities.build(activity_params)

		if @activity.save
			#send to the index
			redirect_to company_activity_path @company, @activity
		else
			#else present the new form again
			render 'new'
		end
	end

	def update
		@activity =  @company.activities.find(params[:id])

		if @activity.update(activity_params)
			redirect_to company_activity_path @company, @activity
		else
			render 'edit'
		end
	end

	def destroy
		@activity = @company.activities.find(params[:id])
		@activity.destroy

		redirect_to  company_activities @company
	end

	private
		def activity_params
			#on submission, only the following fields are saved
			params.require(:activity).permit(:activity_name,:description,:start_date,:end_date,:location,:vehicle,:mobile,:telephone)
		end

		def set_company
			@company = Company.find(params[:company_id])
		end

end
