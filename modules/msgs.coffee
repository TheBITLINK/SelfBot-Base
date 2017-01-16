aesthetics = require 'aesthetics'

class SenderModule extends BotModule
  init:=>
    @registerCommand 'reverse', (msg, args)=>
      @sendOrEdit msg, args.split('').reverse().join('')

    @registerCommand 'slow', (msg, args)=>
      msg.edit args.substr(0,1)
      cnt = 1;
      int = setInterval =>
        msg.edit(args.substr(0,++cnt))
        clearInterval int if cnt >= args.length+1
      , 1000

    @registerCommand 'rind', {everyone: true}, (msg, args)=>
      replaces = {
        a: '🇦', b: '🇧', c: '🇨', d: '🇩', e: '🇪', f: '🇫', g: '🇬', h: '🇭', i: '🇮'
        j: '🇯', k: '🇰', l: '🇱', m: '🇲', n: '🇳', o: '🇴', p: '🇵', q: '🇶', r: '🇷'
        s: '🇸', t: '🇹', u: '🇺', v: '🇻', w: '🇼', x: '🇽', y: '🇾', z: '🇿', '0': '0⃣'
        '1': '1⃣', '2': '2⃣', '3':'3⃣', '4':'4⃣', '5': '5⃣', '6': '6⃣', '7': '7⃣', '8': '8⃣'
        '9': '9⃣', '*': '*⃣', '#': '#⃣'
      }
      @sendOrEdit msg, args.replace(/([\s\S])/g, (s, key)=> (replaces[key.toLowerCase()] or s)+' ')

    @registerCommand 'aesthetic', {everyone: true}, (msg,args)=>
      @sendOrEdit msg, aesthetics(args)

    @registerCommand 'em', { argSeparator: '|' }, (msg, args)=>
      color = 0xAAFF00
      description = args[0]
      author = undefined
      if args.length >= 2
        color = parseInt(args[0].replace('#', '0x'))
        description = args[1]
      if args.length >= 3
        description = args[2]
        author =
          name: args[1]
      msg.delete()
      msg.channel.sendMessage ' ', false, {
        color
        description
        author
      }


  sendOrEdit: (msg, content)=>
    if msg.author.id is @engine.bot.User.id
      msg.edit content
    else
      msg.reply content

module.exports = SenderModule
