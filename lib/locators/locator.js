(function() {
  var Locator;

  Locator = (function() {
    function Locator() {
      this.locators = {};
    }

    Locator.dimensions = function(dimensions) {
      var d, _i, _len, _results;
      _results = [];
      for (_i = 0, _len = dimensions.length; _i < _len; _i++) {
        d = dimensions[_i];
        _results.push(this.addDimension(d));
      }
      return _results;
    };

    Locator.addDimension = function(name) {
      this.prototype[name] = function(value) {
        if (typeof value.compile === 'function') {
          this.locators[name] = value.compile();
        } else {
          this.locators[name] = value;
        }
        return this;
      };
      return this;
    };

    Locator.prototype.compile = function() {
      var key, locator, name, str, value, _ref;
      str = '';
      _ref = this.locators;
      for (name in _ref) {
        locator = _ref[name];
        if (typeof locator === 'string' || typeof locator === 'number') {
          str = "" + str + name + ":" + locator;
        } else if (typeof locator.compile === 'function') {
          str = "" + str + name + ":(" + (locator.compile()) + ")";
        } else {
          str = "" + str + name + ":(";
          for (key in locator) {
            value = locator[key];
            str = "" + str + key + ":" + value + ",";
          }
          str = str.substring(0, str.length - 1);
          str = "" + str + ")";
        }
        str = "" + str + ",";
      }
      str = str.substring(0, str.length - 1);
      return str;
    };

    return Locator;

  })();

  module.exports = Locator;

}).call(this);
