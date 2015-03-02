# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
#

$(document).on 'ready page:load', ->
  task = document.getElementById('task')
  template = document.getElementById('template').cloneNode(true)
  template.style.display = ''
  factory = new (YB.TaskViewFactory)(template)
  $.get 'http://localhost:3000/api/v2/tasks', {
    start_day: '2015-03-02'
    end_day: '2015-03-10'
  }, (data) ->
    $.each data, (i, value) ->
      add_task(value, factory, task)

add_task = (data, factory, task) ->
  t = factory.createTaskView(data, new Date('2015-03-02'), 8)
  t.setBarSize 780, 24
  task.appendChild t.element
