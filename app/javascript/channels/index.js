// Load all the channels within this directory and all subdirectories.
// Channel files must be named *_channel.js.
/* eslint-env node */

const channels = require.context('.', true, /_channel\.js$/)
channels.keys().forEach(channels)
