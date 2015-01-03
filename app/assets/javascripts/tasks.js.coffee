$ ->
  taskList = new Vue(
    el: '#task-list'
    data:
      message: 'hello'
      list: []
      errors: []
    created: ->
      data = @$data
      $.get('/tasks.json').done (res) ->
        data.list = res
    methods:
      submit: ->
        data = @$data
        $.ajax('/tasks', {
          data: JSON.stringify({task: data.newTask})
          type: "post", contentType: "application/json",
          success: (result) ->
            data.list.push data.newTask
            data.newTask = {}
          error: (result) ->
            data.errors = result.responseJSON
        })
      destroy: (task)->
        data = @$data
        $.ajax("/tasks/#{task.id}", {
          type: "delete", contentType: "application/json",
          success: (result) ->
            # TODO
            for t, i in data.list
              data.list.splice i, 1 if task.id == t.id
        })
  )
