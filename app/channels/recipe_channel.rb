# Be sure to restart your server when you modify this file. Action Cable runs in an EventMachine loop that does not support auto reloading.
class RecipeChannel < ApplicationCable::Channel
  def subscribed
    stream_from "recipe_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def add
    ActionCable.server.broadcast('recipe_channel',
      recipe: render_recipe(data['recipe']))
  end

  private

  def render_recipe(recipe)
    ApplicationController.render(partial: 'recipes/recipe',
                                 locals: { recipe: recipe, username: current_user })
  end
end
