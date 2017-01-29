# SelfBot-Base

This is a minimal SelfBot made using [FocaBotCore](https://github.com/FocaBot/FocaBotCore).
It's based on my own SelfBot, but with some sensitive things changed and/or removed.

It's meant to be extended, and it's pretty easy to make your own modules. Some basic modules are included.

## How to use?

- Download and install [Node.js](https://nodejs.org/en/) v7, to run the bot.
- Optionally download [ImageMagick](http://imagemagick.sourceforge.net/http/www/windows.html)
  (for the spoiler and trigger commands).
- [Download](https://github.com/TheBITLINK/SelfBot-Base/archive/master.zip)/Clone this repository to
  an empty folder in your computer.
- Get your discord token:
  - On the Desktop Discord App, press Ctrl+Shift+I.
  - Go to the "Application" tab.
  - In the left, select "Local Storage", and then "https://www.discordapp.com"
  - Find the "token" key and copy it's value (on the right).
  - This token allows access to your account to ANYONE having it, so make sure you keep it in a safe
    place and don't give it to anyone.
    - If your token somehow gets compromised, changing your Discord password should be enough to reset it.
- Edit the `main.js` file:
  - Paste your token there.
  - Optionally edit the public and private prefixes. If you don't want others to use your SelfBot, leave the
    public prefix blank.
  - Optionally type a danbooru tag into the "waifuTag" parameter (this is for the !waifu command).
- Open a command prompt in the same folder as the main.js file (`Shit+Right Click > Open Command Prompt` in Windows).
  - Type the following commands:
    - `npm install`
    - `npm start`
- Your SelfBot should now be running! Test it typing `me!ping` in any Discord chat. (assuming your prefix is `me!`).
- Your SelfBot will keep running as long as you leave CMD open, if you want to start it again, only `npm start` will be necessary.
