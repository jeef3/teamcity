(function() {
  var BuildQueueLocator, Locator,
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  Locator = require('./locator');

  BuildQueueLocator = (function(_super) {
    __extends(BuildQueueLocator, _super);

    function BuildQueueLocator() {
      return BuildQueueLocator.__super__.constructor.apply(this, arguments);
    }

    BuildQueueLocator.dimensions(['project', 'buildType']);

    return BuildQueueLocator;

  })(Locator);

  module.exports = BuildQueueLocator;

}).call(this);
