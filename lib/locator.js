(function() {
  var Locator;

  Locator = (function() {
    function Locator() {
      this.locators = {};
    }

    Locator.prototype.build = function(props) {
      return this._add('build', props);
    };

    Locator.prototype.buildType = function(props) {
      return this._add('buildType', props);
    };

    Locator.prototype.sinceChange = function(props) {
      return this._add('sinceChange', props);
    };

    Locator.prototype.branch = function(props) {
      return this._add('branch', props);
    };

    Locator.prototype.number = function(props) {
      return this._add('number', props);
    };

    Locator.prototype.compile = function() {
      var key, locator, name, str, value, _ref;
      str = '';
      _ref = this.locators;
      for (name in _ref) {
        locator = _ref[name];
        if (typeof locator === 'string' || typeof locator === 'number') {
          str = "" + str + name + ":(" + locator + ")";
        } else if (locator === Locator) {
          str = "" + str + name + ":(" + (locator.build()) + ")";
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

    Locator.prototype._add = function(name, props) {
      if (typeof props.compile === 'function') {
        this.locators[name] = props.compile();
      } else {
        this.locators[name] = props;
      }
      return this;
    };

    return Locator;

  })();

  module.exports = Locator;

}).call(this);
