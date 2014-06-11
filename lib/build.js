(function() {
  var Build;

  Build = (function() {
    function Build(id, client) {
      this.id = id;
      this.client = client;
    }

    Build.prototype.info = function(cb) {
      return this.client._get("/builds/" + this.id, null, cb);
    };

    Build.prototype.query = function(locator, cb) {
      return this.client._get("/builds/?locator=" + (locator.compile()), null, cb);
    };

    return Build;

  })();

  module.exports = Build;

}).call(this);
