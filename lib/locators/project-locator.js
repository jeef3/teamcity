(function() {
  var Locator, ProjectLocator,
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  Locator = require('./locator');

  ProjectLocator = (function(_super) {
    __extends(ProjectLocator, _super);

    function ProjectLocator() {
      return ProjectLocator.__super__.constructor.apply(this, arguments);
    }

    ProjectLocator.dimensions(['id', 'name']);

    return ProjectLocator;

  })(Locator);

  module.exports = ProjectLocator;

}).call(this);
