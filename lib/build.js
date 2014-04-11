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

    return Build;

  })();

  module.exports = Build;

}).call(this);
