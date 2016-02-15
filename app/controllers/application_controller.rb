class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :sidebar_values, except: [:login, :logout]
  def sidebar_values
    @food_preferences = FoodPreference.all.limit(10)
    @food_types = FoodType.all.limit(10)
    @cuisines = Cuisine.all
    # byebug
  end
end
