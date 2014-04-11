(function() {
  var Client, request;

  request = require('request');

  Client = (function() {
    function Client(auth, options) {}

    Client.prototype._url = function(path) {
      return "" + this.options.protocol + "://" + this.options.baseUrl + "/app/rest" + path;
    };

    Client.prototype._get = function(path, params, cb) {
      return request({
        method: 'GET',
        url: this._url(path),
        headers: {
          'Accept': 'application/json'
        }
      }, cb);
    };

    Client.prototype._post = function(path, data, cb) {
      return request.post(this._url(path)).set('Accept', 'application/json').send(data).end(cb);
    };

    Client.prototype._put = function(path, data, cb) {
      return request.put(this._url(path)).set('Accept', 'application/json').send(data).end(cb);
    };

    Client.prototype.build = function(id) {
      return new Build(id, this);
    };

    return Client;

  })();

  module.exports = Client;

}).call(this);
