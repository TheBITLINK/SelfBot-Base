require('coffee-script/register')
const os = require('os');
const path = require('path');
const FocaBotCore = require('focabot-core');

const selfBot = new FocaBotCore({
  name:       'SelfBot',
  selfBot:    true,

  // Prefix
  prefix:     'me!',
  // Prefix used by others
  publicPrefix: 'sb!',
  // Put your token here
  token:      "mfa.0bn...",

  // For the !waifu command
  waifuTag:   '', // danbooru tag

  modulePath: path.join(__dirname, 'modules/'),
});

// Load the modules.
selfBot.modules.load(['ping', 'danbooru', 'image', 'msgs', 'ping', 'poll', 'seal', 'statics', 'status']);

// Connect to discord
selfBot.establishConnection();

console.log(`--- Started (${new Date()}) ---`);
