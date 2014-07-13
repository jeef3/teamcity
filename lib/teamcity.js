(function() {
  var BuildLocator, BuildTypeLocator, ChangesLocator, ProjectLocator, TeamCity;

  ProjectLocator = require('./locators/project-locator');

  ChangesLocator = require('./locators/changes-locator');

  BuildLocator = require('./locators/build-locator');

  BuildTypeLocator = require('./locators/build-type-locator');

  TeamCity = (function() {
    function TeamCity(options) {
      options = options || {};
      if (options.username && options.password) {
        this.auth = {
          username: options.username,
          password: options.password
        };
      }
      this.protocol = options.protocol || 'https';
      this.baseUrl = options.baseUrl || 'localhost:8080';
    }

    TeamCity.prototype.projects = function() {
      return require('./projects')(this);
    };

    TeamCity.prototype.buildTypes = require('./build-types')(TeamCity);

    TeamCity.prototype.builds = function() {
      return require('./builds')(this);
    };

    TeamCity.prototype.buildQueue = function() {
      return require('./build-queue')(this);
    };

    TeamCity.prototype.changes = function() {
      return require('./changes');
    };

    TeamCity.prototype.vcsRootInstances = function() {
      return require('./vcs-root-instances')(this);
    };

    TeamCity.prototype.projectLocator = function() {
      return new ProjectLocator;
    };

    TeamCity.prototype.changesLocator = function() {
      return new ChangesLocator;
    };

    TeamCity.prototype.buildLocator = function() {
      return new BuildLocator;
    };

    TeamCity.prototype.buildTypeLocator = function() {
      return new BuildTypeLocator;
    };

    TeamCity.prototype._url = function(path) {
      return "" + this.protocol + "://" + this.baseUrl + "/app/rest" + path;
    };

    TeamCity.prototype._attachAuth = function(options) {
      if (!this.auth) {
        return;
      }
      if (this.auth) {
        return options.auth = {
          username: this.auth.username,
          password: this.auth.password,
          sendImmediately: true
        };
      }
    };

    TeamCity.prototype._call = function(options, cb) {
      this._attachAuth(options);
      options.headers = {
        'Accept': 'application/json'
      };
      return request(options, function(err, response, body) {
        var data, error;
        if (!cb) {
          return;
        }
        if (err) {
          cb(err);
        }
        if (typeof body === 'string') {
          try {
            data = JSON.parse(body);
          } catch (_error) {
            error = _error;
            err = body;
          }
        } else {
          data = body;
        }
        return cb(err, data);
      });
    };

    TeamCity.prototype._get = function(path, params, cb) {
      var options;
      console.log(path, params);
      options = {
        method: 'GET',
        url: this._url(path)
      };
      if (typeof params === 'function') {
        cb = params;
      } else {
        options.qs = params;
      }
      return this._call(options, cb);
    };

    TeamCity.prototype._post = function(path, data, cb) {
      var options;
      options = {
        method: 'POST',
        url: this._url(path),
        json: data
      };
      return this._call(options, cb);
    };

    TeamCity.prototype._put = function(path, data, cb) {
      var options;
      options = {
        method: 'PUT',
        url: this._url(path),
        json: data
      };
      return this._call(options, cb);
    };

    return TeamCity;

  })();

  module.exports.TeamCity = TeamCity;

}).call(this);
