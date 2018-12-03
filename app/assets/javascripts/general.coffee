$(document).on 'turbolinks:load', ->
  $("body").on 'click', '.batch-destroy', (e) ->
    e.preventDefault()
    return unless confirm('Are you sure?')

    url = $(@).prop('href')
    ids = []

    $(".list-checkbox").each (index) ->
      if $(@).prop('checked')
        ids.push $(@).data('id')

    $.ajax {
      url: url,
      type: 'DELETE',
      data: {ids: ids},
      success: (result) ->
        console.log('done')
    }
