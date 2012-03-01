$ loadTooltip = ->
  $('[data-tooltip]').tipsy
    fade: true
    live: true

window.sortTasks = ->
  $('ol.sortable').sortable
    connectWith: 'ol.sortable',
    placeholder: 'tasks placeholder',
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

$ enableSort = ->
  if $('ol.sortable').length
    sortTasks()

$ addPomodoro = ->
  $('form.edit_task input').live "click", ->
    $(this).submit()
    $(this).attr('disabled', 'disabled')
    $('.tipsy').remove()

$ highlightPomodoro = ->
  $('form.edit_task label').live "mouseover", ->
    $(this).addClass('active')
    $(this).prevAll('label').addClass('active')
  $('form.edit_task label').live "mouseout", ->
    $(this).removeClass('active')
    $(this).prevAll('label').removeClass('active')

window.reloadTask = (task) ->
  $.ajax
    url: $(task).data('url')
    success: (data) ->
      $(task).replaceWith(data)
      pomodoroStarted()

$ pomodoroStarted = ->
  if $('.timestamp').length
    $('.timestamp').timeago()

$ disableStart = ->
  if $('.timestamp').length
    $('.start_pomodoro').hide()

stopCountdown = ->
  alert 'hi'

window.startCountdown = (seconds) ->
  $('#timeleft span').countdown
    format: 'MS',
    compact: true,
    until: seconds + 'S',
    onExpiry: stopCountdown

$ countdownPomodoro = ->
  if $('#timeleft')
    seconds = $('#timeleft').data('time-left')
    startCountdown(seconds)
