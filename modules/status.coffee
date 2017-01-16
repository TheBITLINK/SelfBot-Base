request = require 'request'

class StatusModule extends BotModule
  init:=>
    @registerCommand 'setgame', { allowDM: true }, (msg, game)=>
      @bot.User.setGame(game)
      msg.channel.sendMessage 'Status changed!'

    @registerCommand 'setstatus', { allowDM: true }, (msg, status)=>
      # Status can be either 'online', 'dnd', 'away' or 'invisible'
      @bot.User.setStatus(status.toLowerCase())
      msg.channel.sendMessage 'Status changed!'

    @registerCommand 'setnickname', (msg, nickname)=>
      msg.member.setNickname(nickname)
      .then => msg.channel.sendMessage "Nickname changed succesfully!"
      .catch => msg.channel.sendMessage "Couldn't set nickname. Make sure you have enough permissions."

    @registerCommand 'setusername', { allowDM:true }, (msg, username)=>
      @bot.User.setUsername(username)
      .then => msg.channel.sendMessage 'Username changed.'
      .catch => msg.channel.sendMessage "Couldn't change the username."

    @registerCommand 'setavatar', { allowDM: true }, (msg)=>
      return if not msg.attachments[0]
      request { url: msg.attachments[0].url, encoding: null }, (error, response, body)=>
        @bot.User.setAvatar body if not error and response.statusCode == 200

module.exports = StatusModule
