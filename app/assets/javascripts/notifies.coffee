$(document).on 'turbolinks:load', ->

  if $("#notify_indefinite").val() == 'true'
    $("#notify_expiration_to_1i").attr('readonly', true)
    $("#notify_expiration_to_2i").attr('readonly', true)
    $("#notify_expiration_to_3i").attr('readonly', true)

  $("body").on 'change', '#notify_indefinite', (e) ->
    if $(@).val() == 'true'
      $("#notify_expiration_to_1i").attr('readonly', true)
      $("#notify_expiration_to_2i").attr('readonly', true)
      $("#notify_expiration_to_3i").attr('readonly', true)
      $("#notify_expiration_to_1i").val(null)
      $("#notify_expiration_to_2i").val(null)
      $("#notify_expiration_to_3i").val(null)
    else
      $("#notify_expiration_to_1i").attr('readonly', false)
      $("#notify_expiration_to_2i").attr('readonly', false)
      $("#notify_expiration_to_3i").attr('readonly', false)


  $("body").on 'change', '#notify_hidden', (e) ->
    if $(@).val() == 'true'
      $("#notify_hidden_at").val(new Date())
    else
      $("#notify_hidden_at").val(null)