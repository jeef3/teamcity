(function() {
  var ChangeLocator, Locator,
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  Locator = require('./locator');

  ChangeLocator = (function(_super) {
    __extends(ChangeLocator, _super);

    function ChangeLocator() {
      return ChangeLocator.__super__.constructor.apply(this, arguments);
    }

    ChangeLocator.dimensions(['id', 'branch', 'project', 'buildType', 'build', 'vcsRoot', 'vcsRootInstance', 'username', 'user', 'version', 'internalVersion', 'comment', 'file', 'sinceChange', 'lookupLimit', 'start', 'count']);

    return ChangeLocator;

  })(Locator);

  module.exports = ChangeLocator;

}).call(this);
