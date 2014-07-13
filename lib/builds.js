(function() {
  module.exports = function(client) {
    return function(locator, cb) {
      var id;
      if (typeof locator === 'function') {
        cb = locator;
        return client._get('/builds', cb);
      } else if (locator.compile) {
        console.log('was locator', locator);
        return client._get('/builds', {
          locator: locator.compile()
        }, cb);
      } else {
        console.log('was id', locator);
        id = locator;
        return client._get("/builds/" + id, cb);
      }
    };
  };

}).call(this);
