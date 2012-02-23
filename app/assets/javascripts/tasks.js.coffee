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
