# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
#

SHOWDAY = 8

$(document).on 'ready page:load', ->
  $('a[rel*=leanModal]').leanModal
    top: 50
    overlay: 0.7
    closeButton: '.modal_close'

  $('#yabasa-slider').radiosToSlider();
  $("#datepicker").datepicker();

  task = document.getElementById('task')
  template = document.getElementById('template').cloneNode(true)
  template.style.display = ''
  factory = new (YB.TaskViewFactory)(template)

  today = new Date()
  year = today.getFullYear()
  month = today.getMonth() + 1
  date = today.getDate()
  start_day = year + '-' + ('0' + month).slice(-2) + '-' + ('0' + date).slice(-2)
  end_day = year + '-' + ('0' + month).slice(-2) + '-' + ('0' + (date + SHOWDAY)).slice(-2)

  $.get 'http://localhost:3000/api/v2/tasks', {
    start_day: start_day
    end_day: end_day
  }, (data) ->
    $.each data, (i, value) ->
      add_task(value, factory, task, start_day)

add_task = (data, factory, task, start_day) ->
  t = factory.createTaskView(data, new Date(start_day), SHOWDAY)
  t.setBarSize 780, 24
  task.appendChild t.element
