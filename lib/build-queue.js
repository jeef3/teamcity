(function() {
  module.exports = function(client) {
    var buildQueue;
    buildQueue = function(locator, cb) {
      var id;
      if (typeof locator === 'function') {
        cb = locator;
        return client._get('/buildQueue', cb);
      } else if (locator.compile) {
        return client._get('/buildQueue', {
          locator: locator.compile()
        });
      } else {
        id = locator;
        return client._get("/buildQueue/taskId:" + id, cb);
      }
    };
    buildQueue.add = function(build, cb) {
      return client._post('/buildQueue', build, cb);
    };
    return buildQueue;
  };

}).call(this);
