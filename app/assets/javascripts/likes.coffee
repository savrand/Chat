#$(document).ready ->
##$( '.comment_button' ).click (e) ->
#  $(".like_button").click (e) ->
#    e.preventDefault()
#    $.ajax(
#      url: $('.button_to').attr('action')
#      data: comment: content: $('.comment_content').val()
#      type: 'POST'
#      dataType: 'json').done((json) ->
#      $('.likes_count').html(json.likes_count)
#      return
#    ).always (xhr, status) ->
#    #$(this).remove
#    $(".like_button").remove()
#    return

############################
#$(document).ready ->
#  $(".like_button").click (e) ->
#    e.preventDefault()
#    if $( this ).val() == 'like'
#      $.post($('.button_to').attr('action'),((response) ->
#        console.log("click post")
#        return
#      ), 'json'
#      ).done((json) ->
#        $('.likes_count').html(json.likes_count)
#        return
#      ).always ->
#        $(".like_button").val('unlike')
#        return
#    else if $( this ).val() == 'unlike'
#      $.ajax(
#        utl: $('.button_to').attr('action'),
#        type: 'DELETE'
#        data: ((response) ->
#          console.log($('.button_to').attr('action'))
#          return
#        )
#        dataType: 'json'
#      ).done((json) ->
#        console.log('click delete')
#        $('.likes_count').html(json.likes_count)
#        return
#      ).always ->
#        $(".like_button").val('like')
#        return
###################################
$(document).ready ->
  $("body").on("click", ".like_button", (e) ->
    e.preventDefault()
    $.ajax(
      url: $('.button_to').attr('action')
      #data: comment: content: $('.comment_content').val()
      type: if $("div.likes > section > form > input[name$='_method']").val('delete').length > 0 then 'DELETE' else 'POST'
      dataType: 'json').done((json) ->
      $('.likes_count').html(json.likes_count)
      $('.likes').html(json.html)
      return
    )
  )