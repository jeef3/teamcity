(function() {
  module.exports = function(client) {
    var childGetter, getProject, projects;
    childGetter = function(locator) {
      var identifier;
      identifier = locator.compile ? locator.compile() : locator;
      return {
        buildTypes: function(cb) {
          return client._get("/projects/" + identifier + "/buildTypes", cb);
        },
        templates: function(cb) {
          return client._get("/projects/" + identifier + "/templates", cb);
        },
        parameters: function(param, cb) {
          return client._get("/projects/" + identifier + "/parameters/" + param, cb);
        }
      };
    };
    getProject = function(locator, cb) {
      var id;
      if (locator.compile) {
        return client._get('/projects', {
          locator: locator.compile()
        });
      } else {
        id = locator;
        return client._get("/projects/" + id, cb);
      }
    };
    projects = function(locator, cb) {
      if (typeof locator === 'function') {
        cb = locator;
        return client._get('/projects', cb);
      }
      if (cb && typeof cb === 'function') {
        return getProject(locator, cb);
      } else {
        return childGetter(locator);
      }
    };
    return projects;
  };

}).call(this);
