(function() {
  var Client, Locator;

  Client = require('./client');

  Locator = require('./locator');

  module.exports = {
    client: function(options) {
      return new Client(options);
    },
    locator: function() {
      return new Locator;
    }
  };

}).call(this);
