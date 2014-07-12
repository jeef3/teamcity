(function() {
  module.exports = function(client) {
    return function(locator, cb) {
      var id;
      if (typeof locator === 'function') {
        cb = locator;
        return client._get('/changes', cb);
      } else if (locator.compile) {
        return client._get('/changes', {
          locator: locator.compile()
        }, cb);
      } else {
        id = locator;
        return client._get("/changes/" + id, cb);
      }
    };
  };

}).call(this);
