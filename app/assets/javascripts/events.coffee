# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready = ->
  Vue.http.interceptors.push(
    request: (request)->
      Vue.http.headers.common['X-CSRF-Token'] = $('[name="csrf-token"]').attr('content')
      request  
    response: (response)->
      response  
  )

  Vue.component('event-row', {
    template: '#event-row-template',
    props: {
      evt: {
        type: Object
      }
    }
    data: ->
      editMode: false,
      errors: {},
      title: this.evt.title
    methods:
      updateEvent: ->
        that = this
        $.ajax(
          method: 'PUT'
          data:
            event: that.evt
          url: '/events/' + that.evt.id + '.json',
          success: (res)->
            that.errors = {}
            # that.evt = res
            # title = res.title
            that.editMode = false
          error: (res)->
            that.errors = res.reponseJSON.errors
        )
        return
      removeEvent: ->
        that = this
        $.ajax(
          method: 'DELETE'
          url: '/events/' + that.evt.id + '.json',
          success: (res)->
            that.events.$remove(that.evt)
            return
          error: (res)->
            that.errors = res.reponseJSON.errors  
        )
  })

  d = new Date()

  events = new Vue(
    el: 
      '#events'
    data: 
      events: []
      event:
        title: 'empty'
        start_date:
          d.getFullYear()+"-"\
             +(d.getMonth()+1)+"-" \
             +d.getDate()+" " \
             +d.getHours()+":"\
             +d.getMinutes()+":"\
             +d.getSeconds()
        end_date:
          d.getFullYear()+"-"\
             +(d.getMonth()+1)+"-" \
             +(d.getDate()+1)+" " \
             +d.getHours()+":"\
             +d.getMinutes()+":"\
             +d.getSeconds()
        location: ''
        agenda: ''
        address: ''
        organizer_id: ''
        all_tags: ''
      errors: {}
    methods:
      addEvent: ->
        that = this
        this.$http.post('/events.json',{ event: this.event }).then(
          (res)->
            that.errors = {}
            that.event = {}
            that.events.push(res.data)
            return
          (res)->
            that.errors = res.data.errors
            return
        )
        return
    mounted: ->
      that = this
      $.ajax(
        url:
          '/events.json'
        success: (res)->
          that.events = res
          return
      )
      return
  );


$(document).ready(ready)
$(document).on('page:load', ready)
