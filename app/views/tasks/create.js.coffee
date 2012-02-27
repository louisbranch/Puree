$('form#new_task')[0].reset()
$('ol#unassigned_tasks').append("<%= escape_javascript(render :partial => 'tasks/task', :locals => {:task => @task}) %>")
