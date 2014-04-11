(function() {
  var Build, Client, VcsRootInstance, request;

  request = require('request');

  Build = require('./build');

  VcsRootInstance = require('./vcs-root-instance');

  Client = (function() {
    function Client(options) {
      if (options.username && options.password) {
        this.auth = {
          username: options.username,
          password: options.password
        };
      }
      this.protocol = options.protocol || 'https';
      this.baseUrl = options.baseUrl || 'localhost:8080';
    }

    Client.prototype._url = function(path) {
      return "" + this.protocol + "://" + this.baseUrl + "/app/rest" + path;
    };

    Client.prototype._attachAuth = function(options) {
      if (this.auth) {
        return options.auth = {
          username: this.auth.username,
          password: this.auth.password,
          sendImmediately: true
        };
      }
    };

    Client.prototype._call = function(options, cb) {
      this._attachAuth(options);
      return request(options, function(err, response, body) {
        var obj;
        obj = JSON.parse(body);
        return cb(err, obj);
      });
    };

    Client.prototype._get = function(path, params, cb) {
      var options;
      options = {
        method: 'GET',
        url: this._url(path),
        qs: params,
        headers: {
          'Accept': 'application/json'
        }
      };
      return this._call(options, cb);
    };

    Client.prototype._post = function(path, data, cb) {
      var options;
      options = {
        method: 'POST',
        url: this._url(path),
        form: data,
        headers: {
          'Accept': 'application/json'
        }
      };
      return this._call(options, cb);
    };

    Client.prototype._put = function(path, data, cb) {
      var options;
      options = {
        method: 'PUT',
        url: this._url(path),
        form: data,
        headers: {
          'Accept': 'application/json'
        }
      };
      return this._call(options, cb);
    };

    Client.prototype.build = function(id) {
      return new Build(id, this);
    };

    Client.prototype.vcsRootInstance = function(id) {
      return new VcsRootInstance(id, this);
    };

    return Client;

  })();

  module.exports = Client;

}).call(this);
