# From FocaBot, simplified
danbooru = require('request-promise').defaults {
  baseUrl: 'https://danbooru.donmai.us/'
  simple: true
}

safebooru = require('request-promise').defaults {
  baseUrl: 'https://safebooru.donmai.us/'
  simple: true
}

class DanbooruModule extends BotModule
  init: =>
    @registerCommand 'danbooru', { allowDM: true, aliases: ['d'] }, (msg, tags)=>
      qs = {
        random: true
        tags
      }
      danbooru.get '/posts.json', { json: true, qs }
      .then (r)=>
        if r.length
          url = "https://danbooru.donmai.us#{r[0].file_url}"
          msg.channel.sendMessage '', false, {
            title: '[click for sauce]'
            url: "https://danbooru.donmai.us/posts/#{r[0].id}"
            image: { url }
          }
        else
          msg.channel.sendMessage 'No results.'
      .catch (e)=>
        console.error e
        msg.channel.sendMessage 'Something went wrong.'

    @registerCommand 'safebooru', { allowDM: true, aliases: ['safe'] }, (msg, tags, d)=>
      qs = {
        random: true
        tags
      }
      safebooru.get '/posts.json', { json: true, qs }
      .then (r)=>
        if r.length
          url = "https://safebooru.donmai.us#{r[0].file_url}"
          msg.channel.sendMessage '', false, {
            title: '[click for sauce]'
            url: "https://safebooru.donmai.us/posts/#{r[0].id}"
            image: { url }
          }
        else
          msg.channel.sendMessage 'No results.'
      .catch (e)=>
        console.error e
        msg.channel.sendMessage 'Something went wrong.'

    @registerCommand 'waifu', { aliases: ['w'], allowDM: true }, (msg, args, d)=>
      return msg.channel.sendMessage 'Please edit `main.js` and set the `waifuTag`parameter,' if not Core.settings.waifuTag
      qs = {
        random: true
        tags: 'solo ' + Core.settings.waifuTag
      }
      safebooru.get '/posts.json', { json: true, qs }
      .then (r)=>
        if r.length
          url = "https://safebooru.donmai.us#{r[0].file_url}"
          msg.channel.sendMessage '', false, {
            title: '[click for sauce]'
            url: "https://safebooru.donmai.us/posts/#{r[0].id}"
            image: { url }
          }
        else
          msg.channel.sendMessage 'No results.'
      .catch (e)=>
        console.error e
        return msg.channel.sendMessage e.msg if e.msg
        msg.channel.sendMessage 'Something went wrong.'

  getFileName: (url)=> url.split('/').reverse()[0]


module.exports = DanbooruModule
