$(document).ready ->
  console.log "notification ws"
  if $('.email').length > 0
    email = $('.email')
    App.notify_chat = App.cable.subscriptions.create {
      channel: "ChatNotificationsChannel"
      user_email: $('.email').text().trim()
    },
      connected: ->
# Called when the subscription is ready for use on the server
        console.log "Connected to notification"
      disconnected: ->
# Called when the subscription has been terminated by the server
      received: (data) ->
        console.log "RECEIVED"
        #console.log data['notification']
        #$('.messages').append data['message']
        if $(".conversation[data-conversation = #{data['channel_id']}]").length > 0
          $(".conversation[data-conversation = #{data['channel_id']}]>.conversation-messages").append(data['message'])
          $('.conversation-messages').scrollTop($('.conversation-messages').prop("scrollHeight"))
        else
          $.ajax(
            url: "/conversations/#{data['channel_id']}/show_partial"
  #data: chat_room_id
            type: 'GET'
            dataType: 'json').done((json) ->
            $('.mini-chat').append(json.html)
            $('.conversation-messages').scrollTop($('.conversation-messages').prop("scrollHeight"))
            return
          )
      send_message: (message, chat_room_id) ->
        console.log "SEND MESSAGE #{chat_room_id}"
        @perform 'send_message', message: message, chat_room_id: chat_room_id

################################################################################
    $("body").on("click", ".message_button", (e) ->
      e.preventDefault()
      console.log "тыц"
      #textarea = $('#message_content')
      textarea = $(this).parents('form:first').find('textarea')
      if $.trim(textarea.val()).length > 0
        console.log $('.conversation').attr('data-conversation')
        App.notify_chat.send_message textarea.val(), $(this).parents('.conversation:first').attr('data-conversation')
        textarea.val('')
      console.log "опа"
      return false
    )
    $("body").on("click", ".hide-chat-btn", (e) ->
      e.preventDefault()

    )




