(function() {
  var Client;

  Client = require('./client');

  module.exports.client = function(options) {
    return new Client(options);
  };

}).call(this);
