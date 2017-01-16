moment = require 'moment'
os = require 'os'

class StatsModule extends BotModule
  init: =>
    @registerCommand 'stats', (msg, args)=>
      serverCount = @bot.Guilds.length
      reply = """
      **#{@bot.User.username}'s Stats**

      SelfBot Uptime: #{Core.bootDate.fromNow(true)}
      SelfBot Game: `#{@bot.User.gameName or 'Nothing'}`
      SelfBot Status: `#{@bot.User.status}`

      Currently joined to #{serverCount} servers.
      """
      msg.channel.sendMessage reply

module.exports = StatsModule
