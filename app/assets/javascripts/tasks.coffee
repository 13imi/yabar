# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
#

$(document).on 'ready page:load', ->
  task = document.getElementById('task')
  template = document.getElementById('template').cloneNode(true)
  template.style.display = ''
  factory = new (YB.TaskViewFactory)(template)
  $.get 'http://localhost:3000/api/v1/tasks', {
    start_day: '2015-03-02'
    end_day: '2015-03-10'
    user_id: 1
  }, (data) ->
    console.log data
    $.each data, (i, value) ->
      add_task(value, factory, task)
      console.log i + value
      return

  # t = factory.createTaskView({
  #   id: '1'
  #   createdAt: '2015-01-21 02:47:20 UTC'
  #   name: 'タスク名1'
  #   deadline: '2015-03-10'
  #   yabasa: '2'
  #   memo: 'メモ1'
  #   duration: 4
  # }, new Date('2015-03-02'), 8)
  # t.setBarSize 780, 24
  # t.addTodo new Date('2015-03-30')
  # task.appendChild t.element

  # t = factory.createTaskView({
  #   id: '2'
  #   createdAt: '2015-01-21 02:47:20 UTC'
  #   name: 'タスク名2'
  #   deadline: '2015-03-31'
  #   yabasa: '2'
  #   memo: 'メモ1'
  #   duration: 4
  # }, new Date('2015-03-29'), 8)
  # t.setBarSize 780, 24
  # t.addTodo new Date('2015-03-27')
  # task.appendChild t.element

add_task = (data, factory, task) ->
  t = factory.createTaskView(data, new Date('2015-03-02'), 8)
  t.setBarSize 780, 24
  task.appendChild t.element
