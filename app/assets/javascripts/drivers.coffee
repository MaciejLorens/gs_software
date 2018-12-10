$(document).on 'turbolinks:load', ->

  $("body").on 'change', '#driver_hidden', (e) ->
    if $(@).val() == 'true'
      $("#driver_hidden_at").val(new Date())
    else
      $("#driver_hidden_at").val(null)
