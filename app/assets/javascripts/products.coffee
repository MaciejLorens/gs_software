$(document).on 'turbolinks:load', ->

  $("body").on 'change', '#product_hidden', (e) ->
    if $(@).val() == 'true'
      $("#product_hidden_at").val(new Date())
    else
      $("#product_hidden_at").val(null)
