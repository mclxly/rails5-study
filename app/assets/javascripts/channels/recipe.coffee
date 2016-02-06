App.recipe = App.cable.subscriptions.create "RecipeChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    console.log('recv')
    console.log(data)
    my = """
    <tr>
        <td>#{data.recipe.title}</td>
        <td>#{data.recipe.cooking_time}</td>
        <td>#{data.recipe.difficulty_level}</td>
        <td>#{data.recipe.title}</td>
        <td>#{data.recipe.title}</td>
        <td>#{data.recipe.title}</td>
        <td>#{data.recipe.ingredients}</td>
        <td>#{data.recipe.procedure}</td>
        <td><a href="/recipes/#{data.recipe.id}">Show</a></td>
        <td><a href="/recipes/#{data.recipe.id}/edit">Edit</a></td>
        <td><a data-confirm="Are you sure?" rel="nofollow" data-method="delete" href="/recipes/#{data.recipe.id}">Destroy</a></td>
    </tr>
    """

    $('#recipe-body').append(my)
    # $('#recipes').append(data.recipe)

  add: (data)->
    @perform 'add', recipe: data

$(document).on 'click', '#chat-speak', (event) ->
    App.recipe.add()
    event.target.value = ""
    event.preventDefault()