$ loadTooltip = ->
  if $('[data-tooltip]').length
    $('[data-tooltip]').tipsy
      fade: true

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

$ addPomodoro = ->
  if $('form.edit_task').length
    highlightPomodoro()
    $('form.edit_task input').click ->
      $(this).submit()
      $(this).attr('disabled', 'disabled')
      $('.tipsy').remove()

highlightPomodoro = ->
  $('form.edit_task label').hover(
    ->
      $(this).addClass('active')
      $(this).prevAll('label').addClass('active')
    ->
      $(this).removeClass('active')
      $(this).prevAll('label').removeClass('active')
  )

window.reloadTask = (task) ->
  $.ajax
    url: $(task).data('url')
    success: (data) ->
      $(task).replaceWith(data)
      addPomodoro()
      loadTooltip()
