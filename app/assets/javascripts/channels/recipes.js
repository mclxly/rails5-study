App.recipes = App.cable.subscriptions.create('RecipesChannel', {  
  received: function(data) {
    return $('#recipes').append(this.renderRecipe(data));
  },
  renderRecipe: function(data) {
    return "<p> <b>" + data.recipe + ": </b>" + data.time + "</p>";
  }
});