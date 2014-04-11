'use strict';

var request = require('request');
var Q = require('q');

function Client(username, password) {

}

module.exports = {
  client: function (username, password) {
    return new Client(username, password);
  },

  getBuild: function (buildNumber) {
    var deferred = Q.defer();

    console.log('Getting build info for build', buildNumber);

    var options = {
      url: 'http://' + process.env.TC_URL + '/app/rest/builds/' + buildNumber,
      headers: {
        'Accept': 'application/json'
      }
    };

    request.get(options, function (err, response, buildInfo) {
      if (err || response.statusCode !== 200) {
        deferred.reject(err);
      }

      deferred.resolve(JSON.parse(buildInfo));
    });

    return deferred.promise;
  },

  getVscRootInstance: function (vcsRootInstanceId) {
    var deferred = Q.defer();

    console.log('Getting VCS root instance', vcsRootInstanceId);

    var options = {
      url: 'http://' + process.env.TC_URL + '/app/rest/vcs-root-instances/id:' + vcsRootInstanceId,
      headers: {
        'Accept': 'application/json'
      }
    };

    request.get(options, function (err, response, vcsRootInstance) {
      if (err || response.statusCode !== 200) {
        deferred.reject(err);
      }

      deferred.resolve(JSON.parse(vcsRootInstance));
    });

    return deferred.promise;
  }
};
