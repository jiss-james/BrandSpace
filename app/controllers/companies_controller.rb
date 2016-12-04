class CompaniesController < InheritedResources::Base

	before_action :authenticate_user!
	load_and_authorize_resource
	
	def index
		@companies = Company.all
	end

	def show
		#the company with the id passed in, is retrieved
		@company = Company.find(params[:id])
	end

	def new
		@company = Company.new
	end

	def edit
		@company = Company.find(params[:id])
	end

	def create
		#the new company's parameters are received from the form and stored
		@company = current_user.companies.build(company_params)

		#if there are no errors save the company
		if @company.save
			#send to the index
			redirect_to @company
		else
			#else present the new form again
			render 'new'
		end
	end

	def update
		@company = Company.find(params[:id])

		if @company.update(company_params)
			redirect_to @company
		else
			render 'edit'
		end
	end

	def destroy
		@company = Company.find(params[:id])
		@company.destroy

		redirect_to companies_path
	end

	private
		def company_params
			#on submission, only the following fields are saved
			params.require(:company).permit(:company_name,:description,:location)
		end

end
