class CareersController < ApplicationController
  before_action :current_path_career, only: [:edit, :update]

  def new
    @user = User.find(params[:user_id])
    @career = Career.new
  end

  def create
    @career = Career.new(career_params)
    @career.save
    redirect_to user_path(@career.user_id)
  end

  def edit
  end

  def update
    @career.update(career_params)
    redirect_to user_path(@career.user_id)
  end

  private
  def career_params
    params.require(:career).permit(:worthwhile, :ideal_candidate, :can_do_now, :recommended_book).merge(user_id: params[:user_id])
  end

  def current_path_career
    @career = Career.find(params[:id])
  end
end