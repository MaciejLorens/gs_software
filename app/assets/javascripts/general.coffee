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
      if confirm('Are you sure you want delete ' + ids.length + ' records?')
        $.ajax {
          url: url,
          type: 'DELETE',
          data: {ids: ids},
          success: (result) ->
            console.log('done')
        }
