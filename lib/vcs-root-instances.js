(function() {
  module.exports = function(client) {
    return function(locator, cb) {
      var id;
      if (typeof locator === 'function') {
        cb = locator;
        return client._get('/vcs-root-instances', cb);
      } else if (locator.compile) {
        return client._get('/vcs-root-instances', {
          locator: locator.compile()
        }, cb);
      } else {
        id = locator;
        return client._get("/vcs-root-instances/" + id, cb);
      }
    };
  };

}).call(this);
