class AttractionsController < ApplicationController
  before_action :authenticate_user!

  def index
    @attraction = Facade::AttractionFacade.new(current_user)
  end

  def create
    @attraction = Attraction.new(attraction_params)
    @attraction.user = current_user

    if @attraction.save
      redirect_to root_path, notice: t('attraction.alerts.created')
    else
      redirect_to root_path, alert: t('attraction.alerts.not_created')
    end
  end

  private

  def attraction_params
    params.require(:attraction).permit(:name, :description, :media, :date)
  end
end
