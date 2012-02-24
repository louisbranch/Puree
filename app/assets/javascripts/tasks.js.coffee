$ sortTasks = ->
  if $('ol.sortable').length
    $('ol.sortable').sortable
      connectWith: 'ol.sortable',
      placeholder: 'tasks placeholder',
      handle: 'i.handle',
      opacity: 0.9,
      over: ->
        $(this).addClass('active')
      out: ->
        $(this).removeClass('active')
      update: (event, ui) ->
        $.ajax
          type: 'POST'
          url: $(this).data('sort-url')
          data: $(this).sortable('serialize')
          success: ->
            reloadTask(ui.item) if ui.item

$ addPomodoroToTask = ->
  if $('form.edit_task input.pomodoros').length
    $('form.edit_task input.pomodoros').click ->
      $(this).parent().siblings('label').removeClass('selected')
      $(this).parent().addClass('selected')
      $(this).parent().submit()
      reloadTask($(this).parents('li.tasks'))

reloadTask = (task) ->
  $.ajax
    url: $(task).data('url')
    success: (data) ->
      $(task).replaceWith(data)
      addPomodoroToTask()
