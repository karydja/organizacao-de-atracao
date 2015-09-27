class Facade::AttractionFacade
  attr_reader :user

  def initialize(user)
    @user = user
  end

  def new_attraction
    @new_attraction = Attraction.new
  end

  def user_attractions
    @user_attraction = @user.attractions.decorate
  end
end