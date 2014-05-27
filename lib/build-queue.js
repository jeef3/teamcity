(function() {
  var BuildQueue;

  BuildQueue = (function() {
    function BuildQueue(client) {
      this.client = client;
    }

    BuildQueue.prototype.add = function(build, cb) {
      return this.client._post('/buildQueue', build, cb);
    };

    BuildQueue.prototype.findTask = function(taskId, cb) {
      return this.client._get("/buildQueue/taskId:" + taskId, null, cb);
    };

    return BuildQueue;

  })();

  module.exports = BuildQueue;

}).call(this);
