class SearchController < ApplicationController

  def results
    @q = params[:q]
    @category = params[:category]
    if @category == "activity"
      @results = Activity.where("activity_name ILIKE ?", "%#{@q}%")
    elsif @category == "user"
      @results = User.where("user_first_name ILIKE ?", "%#{@q}%")
    else
      @results = Company.where("company_name ILIKE ?", "%#{@q}%")
    end
  end

end
