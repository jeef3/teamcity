(function() {
  var BuildTypeLocator, Locator,
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  Locator = require('./locator');

  BuildTypeLocator = (function(_super) {
    __extends(BuildTypeLocator, _super);

    function BuildTypeLocator() {
      return BuildTypeLocator.__super__.constructor.apply(this, arguments);
    }

    BuildTypeLocator.dimensions(['id', 'name', 'internalId', 'project', 'affectedProject', 'template', 'templateFlag', 'paused']);

    return BuildTypeLocator;

  })(Locator);

  module.exports = BuildTypeLocator;

}).call(this);
