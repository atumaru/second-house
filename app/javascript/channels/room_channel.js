import consumer from './consumer'

$(function() {
  const chatChannel = consumer.subscriptions.create({ channel: 'RoomChannel', room: $('#messages').data('room_id') }, {
    connected() {
      // Called when the subscription is ready for use on the server
    },

    disconnected() {
      // Called when the subscription has been terminated by the server
    },

    received: function(data) {
      if (data["isCurrent_user"]==true){
        content=`<div class='mycomment'><p>${data["message"]}</p></div>`;
      }
      else{
        content=`<div class='balloon6'><div class='faceicon'>
        
        <div class='chatting'><div class='says'><p>${data["message"]}</p>
        </div></div>`;
      }
      return $('#messages').append(data['message']);
    },

    speak: function(message) {
      current_user_id=$("#current_user_id").val();
      return this.perform('speak', {
        message: message,current_user_id: current_user_id
      });
    }
  });

// data-behaviorがroom_speakerである場所でkeypressすると...
  $(document).on('keypress', '[data-behavior~=room_speaker]', function(event) {
    if (event.keyCode === 13) {
      chatChannel.speak(event.target.value);
      event.target.value = '';
      return event.preventDefault();
    }
  });
});