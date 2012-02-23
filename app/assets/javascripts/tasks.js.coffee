$ dragTasks = ->
  if $('ol.sortable').length
    $('ol.sortable').sortable
      connectWith: 'ol.sortable',
      #placeholder: 'user_stories placeholder',
      handle: 'i.handle',
      opacity: 0.9,
      over: ->
        $(this).addClass('active')
      out: ->
        $(this).removeClass('active')
      update: ->
        $.post($(this).data('sort-url'), $(this).sortable('serialize'))

$ addPomodoroToTask = ->
  if $('form.edit_task input.pomodoros').length
    $('form.edit_task input.pomodoros').click ->
      pomodoros = $(this).val()
      $(this).parent().siblings('label').removeClass('selected')
      $(this).parent().addClass('selected')
      $(this).parent().siblings('span').html(pomodoros)
      $(this).parent().submit()
