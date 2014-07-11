(function() {
  var ProjectLocator, Projects;

  ProjectLocator = require('./locators/project-locator');

  Projects = (function() {
    function Projects(client) {
      this.client = client;
      this.locator = ProjectLocator;
    }

    Projects.prototype.get = function(id, cb) {
      return this.locate(new ProjectLocator().id(id), cb);
    };

    Projects.prototype.all = function(cb) {
      return this.client._get('/projects', cb);
    };

    Projects.prototype.locate = function(locator, cb) {
      if (!locator.compile) {
        locator = new ProjectLocator(locator);
      }
      if (cb) {
        return this.client._get('/projects', {
          locate: locator.compile()
        }, cb);
      } else {
        this.locator = locator;
        return this;
      }
    };

    Projects.prototype.buildTypes = {
      all: function(cb) {
        return this.client._get("/projects/" + (this.locator.compile()) + "/buildTypes", cb);
      }
    };

    Projects.prototype.templates = {
      all: function(cb) {
        return this.client._get("/projects/" + (this.locator.compile()) + "/templates", cb);
      }
    };

    return Projects;

  })();

  module.exports = Projects;

}).call(this);
