class RecipesChannel < ApplicationCable::Channel  
  def subscribed
    stream_from 'recipes'
  end
end  