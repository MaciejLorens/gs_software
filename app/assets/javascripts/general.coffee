$(document).on 'turbolinks:load', ->

  $("body").on 'click', '.batch-destroy', (e) ->
    e.preventDefault()

    url = $(@).prop('href')
    ids = []

    $(".list-checkbox").each (index) ->
      if $(@).prop('checked')
        ids.push $(@).data('id')

    if ids.length == 0
      alert('No resources selected')
    else
      if confirm('Are you sure you want to delete ' + ids.length + ' records?')
        $.ajax {
          url: url,
          type: 'DELETE',
          data: {ids: ids}
        }

  $("body").on 'click', '.sort-link', (e) ->
    e.preventDefault()

    field = $(@).data('field')
    $("#s_field").val(field)
    if $(@).hasClass('asc')
      $("#s_order").val('desc')
    else
      $("#s_order").val('asc')

    $(".filter-form").submit()
