(function() {
  var Change;

  Change = (function() {
    function Change(id, client) {
      this.id = id;
      this.client = client;
    }

    Change.prototype.info = function(cb) {
      if (typeof this.locator !== 'number' && typeof this.locator !== 'string') {
        throw 'Calls to info require a change ID';
      }
      return this.client._get("/changes/" + this.locator, cb);
    };

    Change.prototype.query = function(locator, cb) {
      return this.client._get("/changes?locator=" + (locator.compile()), null, cb);
    };

    return Change;

  })();

  module.exports = Change;

}).call(this);
