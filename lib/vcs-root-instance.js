(function() {
  var VcsRootInstance;

  VcsRootInstance = (function() {
    function VcsRootInstance(id, client) {
      this.id = id;
      this.client = client;
    }

    VcsRootInstance.prototype.info = function(cb) {
      return this.client._get("/vcs-root-instances/" + this.id, null, cb);
    };

    return VcsRootInstance;

  })();

  module.exports = VcsRootInstance;

}).call(this);
