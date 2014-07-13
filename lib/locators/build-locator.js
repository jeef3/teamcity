(function() {
  var BuildLocator, Locator,
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  Locator = require('./locator');

  BuildLocator = (function(_super) {
    __extends(BuildLocator, _super);

    function BuildLocator() {
      return BuildLocator.__super__.constructor.apply(this, arguments);
    }

    BuildLocator.dimensions(['buildType', 'tags', 'status', 'user', 'personal', 'canceled', 'running', 'pinned']);

    return BuildLocator;

  })(Locator);

  module.exports = BuildLocator;

}).call(this);
