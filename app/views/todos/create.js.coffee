$('ul#todos').prepend("<%= escape_javascript(render :partial => 'todos/todo', :locals => {:todo => @todo}) %>")
